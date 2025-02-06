vim.opt.termguicolors = true

function SetColor(color)
	color = color or "catppuccin-frappe"
	vim.cmd.colorscheme(color)
-- vim.api.nvim_set_hl(0, "Normal", {bg = "#232324"})
--	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#0E0A23"})
--	vim.api.nvim_set_hl(0, "ColorColumn", {bg = "none"})
-- vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
end

SetColor()
SetColor()


