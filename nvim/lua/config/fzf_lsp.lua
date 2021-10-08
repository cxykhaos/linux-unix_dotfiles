-- require'fzf_lsp'.setup()
-- or you can set them manually.
vim.lsp.handlers["textDocument/codeAction"] = require'fzf_lsp'.code_action_handler
-- vim.lsp.handlers["textDocument/definition"] = require'fzf_lsp'.definition_handler
-- vim.lsp.handlers["textDocument/declaration"] = require'fzf_lsp'.declaration_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = require'fzf_lsp'.type_definition_handler
vim.lsp.handlers["textDocument/implementation"] = require'fzf_lsp'.implementation_handler
-- vim.lsp.handlers["textDocument/references"] = require'fzf_lsp'.references_handler
-- vim.lsp.handlers["textDocument/documentSymbol"] = require'fzf_lsp'.document_symbol_handler
-- vim.lsp.handlers["workspace/symbol"] = require'fzf_lsp'.workspace_symbol_handler
-- vim.lsp.handlers["callHierarchy/incomingCalls"] = require'fzf_lsp'.incoming_calls_handler
-- vim.lsp.handlers["callHierarchy/outgoingCalls"] = require'fzf_lsp'.outgoing_calls_handler

