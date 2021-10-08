
---- function on_attach(client, bufnr)
----     local function buf_set_keymap(...)
----         vim.api.nvim_buf_set_keymap(bufnr, ...)
----     end
----     local function buf_set_option(...)
----         vim.api.nvim_buf_set_option(bufnr, ...)
----     end
---- 
----     buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
---- 
----     -- Mappings.
----     local opts = {noremap = true, silent = true}
---- 
----     -- Set some keybinds conditional on server capabilities
----     if client.resolved_capabilities.document_formatting then
----         buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
----     elseif client.resolved_capabilities.document_range_formatting then
----         buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
----     end
---- end
---- 
---- -- lspInstall + lspconfig stuff
---- 
---- -- open snippet
---- local capabilities = vim.lsp.protocol.make_client_capabilities()
---- capabilities.textDocument.completion.completionItem.snippetSupport = true
---- capabilities.textDocument.completion.completionItem.resolveSupport = {
----   properties = {
----     'documentation',
----     'detail',
----     'additionalTextEdits',
----   }
---- }
---- 
---- local function setup_servers()
----     require "lspinstall".setup()
---- 
----     local lspconf = require("lspconfig")
----     local servers = require "lspinstall".installed_servers()
---- 
----     for _, lang in pairs(servers) do
----         if lang ~= "lua" then
----             lspconf[lang].setup {
----                 -- on_attach = on_attach,
----                 capabilities = capabilities, -- open sinppet
----                 --root_dir = vim.loop.cwd
----             }
----         elseif lang == "lua" then
----             lspconf[lang].setup {
----                 root_dir = function()
----                     return vim.loop.cwd()
----                 end,
----                 settings = {
----                     Lua = {
----                         diagnostics = {
----                             globals = {"vim"}
----                         },
----                         workspace = {
----                             library = {
----                                 [vim.fn.expand("$VIMRUNTIME/lua")] = true,
----                                 [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
----                             }
----                         },
----                         telemetry = {
----                             enable = false
----                         }
----                     }
----                 }
----             }
----         end
----     end
---- end
---- 
---- setup_servers()
-- 
--  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--  require "lspinstall".post_install_hook = function()
--      setup_servers() -- reload installed servers
--      vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--  end
--  
--  -- replace the default lsp diagnostic letters with prettier symbols
--  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
--  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
--  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
--  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- lsp.gopls.setup{on_attach=completion.on_attach}
-- require'completion'.on_attach()
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.gopls.setup{}


vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "\\ga", ":lua vim.lsp.buf.code_action()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent=true, noremap= true })
-- vim.api.nvim_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "\\wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "\\wd", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "\\rn", ":lua vim.lsp.buf.rename()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "\\e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", { silent=true, noremap= true })
vim.api.nvim_set_keymap("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", { silent=true, noremap= true })
