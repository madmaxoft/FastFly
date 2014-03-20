
-- Info.lua

-- Contains the plugin's description, along with command structure





g_PluginInfo =
{
	Name = "FastFly",
	Date = "2014_03_20",
	Description =
	[[
	This plugin allows players to switch between normal-speed and fast-speed movement by using a command
	]],
	
	Commands =
	{
		["/fastfly"] =
		{
			HelpString = "Toggle fast movement",
			Permission = "fastfly.toggle",
			Handler = HandleCmdFastFly,
			ParameterCombinations =
			{
				{
					Params = "",
					Help = "Toggles between fast-speed and normal-speed movement",
				},
				{
					Params = "RelSpeed",
					Help = "Sets the relative speed to RelSpeed-multiple of normal speed",
				},
			},
		},  -- /fastfly
	},  -- Commands
}




