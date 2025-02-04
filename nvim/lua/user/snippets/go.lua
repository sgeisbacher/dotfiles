local luasnip = require("luasnip")
local isn = luasnip.indent_snippet_node
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  s("ierrfmt", { t({ "if err != nil {", '\tfmt.Printf("E: ' }), i(1, "while"), t({ '\\n", err)', "}" }) }),
  s("ierrfmtln", { t({ "if err != nil {", "\tfmt.Println(err)", "}" }) }),
  s("ierrlog", { t({ "if err != nil {", "\tlog.error(err)", "}" }) }),
  s("ierrpanic", { t({ "if err != nil {", "\tpanic(err)", "}" }) }),
  s("ierrret", { t({ "if err != nil {", "\treturn " }), i(1, "nil"), t({ ", err", "}" }) }),
  s("fori", { t("for i := 0; i < "), i(1, "10"), t({ "; i++ {", "" }), i(2), t({ "", "}" }) }),
}
