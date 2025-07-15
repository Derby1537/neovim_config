return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup {
            '*';
            css = {rgb_fn = true};
            html = {names = false;}
        }
		-- #000000
		-- #ffffff
		-- #ff0000
		-- #00ff00
		-- #0000ff
	end,
}
