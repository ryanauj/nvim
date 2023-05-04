function SetRosePine()
	require('rose-pine').setup({
		--- @usage 'auto'|'main'|'moon'|'dawn'
		variant = 'moon'
	})

	-- Set colorscheme after options
	vim.cmd.colorscheme('rose-pine')
end

function SetColors(color)
	if not color then
		SetRosePine()
	else
		vim.cmd(color)
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColors()
