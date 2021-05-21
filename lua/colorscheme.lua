-- ###################################################################################
--	     ______        __             _____        __
--          / ____/____   / /____   _____/ ___/ _____ / /_   ___   ____ ___   ___
--	   / /    / __ \ / // __ \ / ___/\__ \ / ___// __ \ / _ \ / __ `__ \ / _ \
--	  / /___ / /_/ // // /_/ // /   ___/ // /__ / / / //  __// / / / / //  __/
--	  \____/ \____//_/ \____//_/   /____/ \___//_/ /_/ \___//_/ /_/ /_/ \___/
--
-- ###################################################################################


-- Nightbuddy Colorshceme
-- Style options for NightBuddy: twilight, night, midnight
vim.g.nb_style = "twilight"
require("colorbuddy").colorscheme("nightbuddy")

vim.cmd[[hi DashboardHeader guifg=#1FFF00]]

-- Nord colorscheme:
-- require('nord').set()

-- vim.cmd[[colorscheme space-nvim]]

-- Monokai Colorshceme:
-- vim.cmd[[colorscheme monokai]]
