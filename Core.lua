KiNoYo_Rotation = LibStub("AceAddon-3.0"):NewAddon("KiNoYo_Rotation", "AceConsole-3.0");

function KiNoYo_Rotation:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	KiNoYo_Rotation:Print("KiNoYo_Rotation is loaded!");
end

function KiNoYo_Rotation:OnEnable()
	-- Called when the addon is enabled
	KiNoYo_Rotation:Print("KiNoYo_Rotation is enable!");
end

function KiNoYo_Rotation:OnDisable()
	-- Called when the addon is disabled
	KiNoYo_Rotation:Print("KiNoYo_Rotation is disabled!");
end