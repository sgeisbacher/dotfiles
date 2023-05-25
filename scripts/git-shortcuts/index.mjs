#!/usr/bin/env zx

import "zx/globals";
import { $ } from "zx";

$.verbose = true;

async function assertCleanWorktree() {
  const output = await $`git diff --stat`;
  if (output.stdout !== "") {
    throw new Error("worktree not clean!");
  }
}

async function assertInGitWorktree() {
  const output = await $`git rev-parse --is-inside-work-tree`;
  if (output.stdout.split("\n")[0] !== "true") {
    throw new Error("not in git-repo!");
  }
}

async function getBranchName() {
  const output = await $`git rev-parse --abbrev-ref HEAD`;
  return output.stdout.split("\n")[0];
}

await assertInGitWorktree();
await assertCleanWorktree();

const branchName = await getBranchName();
if (["develop", "master"].includes(branchName)) {
  console.log(`already in ${branchName}, skipping ...`);
  process.exit(0);
}

await $`git checkout develop`;
await $`git fetch --prune`;
await $`git pull --ff-only`;
await $`git branch -D ${branchName}`;
