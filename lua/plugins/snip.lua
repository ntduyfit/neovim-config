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
          type {}Props = {{}};
            
          export const {}: React.FC<{}Props> = () => {{
            return (
              <div>{}</div>
            );
          }};

          ]],
          {
            rep(1),
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

          type {}Props = {{}};

          export const {}: React.FC<{}Props> = () => {{
            return (
              <div>{}</div>
            );
          }};

          ]],
          {
            rep(1),
            i(1),
            rep(1),
            rep(1),
          }
        )
      ),
    })

    ls.add_snippets("typescriptreact", {
      s(
        "hook",
        fmt(
          [[
        const {} = use{}(() => {{
          {}
        }}, {})
        
        ]],
          {
            i(1),
            i(2),
            i(5),
            i(3),
          }
        )
      ),
    })
  end,
}
