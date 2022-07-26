
-----require'lspinstall'.setup() -- important
-----
-----
------- Enable snippet
------- https://github.com/hrsh7th/nvim-compe#how-to-use-lsp-snippet
-----local capabilities = vim.lsp.protocol.make_client_capabilities()
-----capabilities.textDocument.completion.completionItem.snippetSupport = true
-----capabilities.textDocument.completion.completionItem.resolveSupport = {
-----  properties = {
-----    'documentation',
-----    'detail',
-----    'additionalTextEdits',
-----  }
-----}
-----
-----function on_attach_callback(client, bufnr)
-----  -- If you use completion-nvim/diagnostic-nvim, uncomment those two lines.
-----  -- require('diagnostic').on_attach()
-----  -- require('completion').on_attach()
-----  require('folding').on_attach()
-----end
-----
-----
-----local servers = require'lspinstall'.installed_servers()
-----for _, server in pairs(servers) do
-----  require'lspconfig'[server].setup{
-----      capabilities = capabilities,
-----      on_attach = on_attach_callback,
-----  }
-----end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    if server.name == "pylsp" then

        opts.settings = {
            pylsp = {
                plugins = {
                    pyflakes = {enabled = false},
                    pylint = {enabled = false},
                    flake8 = {enabled = true},
                },
            },
        }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
end)

