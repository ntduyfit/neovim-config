return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local extra = require("luasnip.extras")
    local rep = extra.rep
    local fmt = require("luasnip.extras.fmt").fmt

    ls.add_snippets("typescriptreact", {
      s(
        "fc",
        fmt(
          [[
          const {}: React.FC = () => {{
            return (
              <div>{}</div>
            );
          }};

          export default {};
          ]],
          {
            i(1),
            rep(1),
            rep(1),
          }
        )
      ),
    })

    ls.add_snippets("typescriptreact", {
      s(
        "cfc",
        fmt(
          [[
          'use client';

          const {}: React.FC = () => {{
            return (
              <div>{}</div>
            );
          }};

          export default {};
          ]],
          {
            i(1),
            rep(1),
            rep(1),
          }
        )
      ),
    })

    ls.add_snippets("typescriptreact", {
      s(
        "ucb",
        fmt(
          [[
        const {} = useCallback(() => {{
          {}
        }}, {})
        
        ]],
          {
            i(1),
            i(3),
            i(2),
          }
        )
      ),
    })
  end,
}
