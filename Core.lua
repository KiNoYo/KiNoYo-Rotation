local AceConfig = LibStub("AceConfig-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0");
local AceConfigCmd = LibStub("AceConfigCmd-3.0");
local KiNoYo_Rotation = LibStub("AceAddon-3.0"):NewAddon("KiNoYo_Rotation", "AceConsole-3.0");

local options = {
	name = "KiNoYo_Rotation",
	desc = "Kill the Nood in You - Rotation",
	handler = KiNoYo_Rotation,
	type = "group",
	args = {
		enable = {
			name = "Enable",
			desc = "Enable / disable this addon",
			type = "toggle",
			set = "SetEnableStatus",
			get = "GetEnableStatus"
		}
	}
};

-- Show the GUI if no input is supplied, otherwise handle the chat input.
function KiNoYo_Rotation:ChatCommand(input)
	-- TODO VDU - open the popup another way.
	if not input or input:trim() == "" then
		AceConfigDialog:Open("KiNoYo_Rotation");
	else
		AceConfigCmd.HandleCommand(KiNoYo_Rotation, "kinoyo", "KiNoYo_Rotation", input);
	end
end

function KiNoYo_Rotation:GetEnableStatus(info)
		return self:IsEnabled();
end

function KiNoYo_Rotation:SetEnableStatus(info, value)
	if value then
		self:Enable();
	else
		self:Disable();
	end
end

function KiNoYo_Rotation:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	self:Print("KiNoYo_Rotation - loaded!");
	AceConfig:RegisterOptionsTable("KiNoYo_Rotation", options);
	self:RegisterChatCommand("kinoyo", "ChatCommand");
end

function KiNoYo_Rotation:OnEnable()
	-- Called when the addon is enabled
	self:Print("KiNoYo_Rotation - enable!");
end

function KiNoYo_Rotation:OnDisable()
	-- Called when the addon is disabled
	self:Print("KiNoYo_Rotation - disabled!");
end
