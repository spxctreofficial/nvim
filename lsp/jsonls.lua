---@brief
---
--- https://github.com/hrsh7th/vscode-langservers-extracted
---
--- vscode-json-language-server, a language server for JSON and JSON schema
---
--- `vscode-json-language-server` can be installed via `npm`:
--- ```sh
--- npm i -g vscode-langservers-extracted
--- ```
return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
  settings = {
      json = {
          schemas = {
              {
                  fileMatch = { 'package.json' },
                  url = 'https://json.schemastore.org/package.json',
              },
              {
                  fileMatch = { 'tsconfig.json', 'tsconfig.app.json', 'tsconfig.node.json' },
                  url = 'https://json.schemastore.org/tsconfig',
              },
          },
      },
  },
}
