local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node

return {
	s("err", {
		t({ "if err != nil {", "\t" }),
		i(1),
		t({ "", "}", "" }),
		i(0),
	}),
	s("errr", {
		t({
			"if err != nil {",
			"\treturn err",
			"}",
            "",
		}),
		i(0),
	}),
}
