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

async function determineMainBranch() {
  const output = await $`git branch -l`.quiet();
  const branchLines = output.stdout.split("\n");
  return (
    [" develop", " main", " master"]
      .find((branchName) =>
        branchLines.some((branchLine) => branchLine.includes(branchName)),
      )
      .trim() || "main branch not detected"
  );
}

await assertInGitWorktree();
await assertCleanWorktree();
const mainBranch = await determineMainBranch();
console.log(`detected main branch: ${mainBranch}`);

const branchName = await getBranchName();
if (["develop", "master"].includes(branchName)) {
  console.log(`already in ${branchName}, skipping ...`);
  process.exit(0);
}

await $`git checkout ${mainBranch}`;
await $`git fetch --prune`;
await $`git pull --ff-only`;
await $`git branch -D ${branchName}`;
