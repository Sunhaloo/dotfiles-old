return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		event = "VeryLazy",
		build = "make install_jsregexp",
		config = function()
			local ls = require "luasnip"
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			-- simple "Hello World" snippet for Python
			ls.add_snippets("python", {
				s("hello", {
					t('print("Hello World")')
				})
			})

			ls.add_snippets("python", {
				s("main", {
					t({
						"def main():",
						"    "
					}),
					i(1, "pass"),
					t({
						"",
						"",
						"if __name__ == '__main__':",
						"    main()"
					}),
				}),
			})

			ls.add_snippets("c", {
				s("main", {
					t({
						"#include <stdio.h>",
						"",
						"int main(int argc, char* argv[]) {",
						'    printf("\\nHello World\\n");',
					}),
					i(),
					t({
						"",
						"",
						"    return 0;",
						"}"
					}),
				}),
			})

		end,
	},
}
