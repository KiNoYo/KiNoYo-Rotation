local AceConfig = LibStub("AceConfig-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0");
local AceConfigCmd = LibStub("AceConfigCmd-3.0");
local AceDB = LibStub("AceDB-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("KiNoYo_Rotation");
local KiNoYo_Rotation = LibStub("AceAddon-3.0"):NewAddon("KiNoYo_Rotation", "AceConsole-3.0");

local defaults = {
		global = {
				test = L["kinoyo/rotation/options/enable/defaultValue"],
				enable = true
		}
};

local options = {
	name = L["kinoyo/rotation/options/name"],
	desc = L["kinoyo/rotation/options/description"],
	handler = KiNoYo_Rotation,
	type = "group",
	args = {
		enable = {
			name = L["kinoyo/rotation/options/enable/name"],
			desc = L["kinoyo/rotation/options/enable/description"],
			type = "toggle",
			set = "SetEnableStatus",
			get = "GetEnableStatus"
		},
		test = {
			name = L["kinoyo/rotation/options/test/name"],
			desc = L["kinoyo/rotation/options/test/description"],
			type = "input",
			set = "SetTest",
			get = "GetTest"
		}
	}
};

-- Show the GUI if no input is supplied, otherwise handle the chat input.
function KiNoYo_Rotation:ChatCommand(input)
	if not input or input:trim() == "" then
		-- AceConfigDialog:Open("KiNoYo_Rotation");
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame);
	else
		AceConfigCmd.HandleCommand(KiNoYo_Rotation, "kinoyo", "KiNoYo_Rotation", input);
	end
end

function KiNoYo_Rotation:GetEnableStatus(info)
		return self:IsEnabled();
end

function KiNoYo_Rotation:SetEnableStatus(info, value)
	self.db.global.enable = value;
	if value then
		self:Enable();
	else
		self:Disable();
	end
end

function KiNoYo_Rotation:GetTest(info)
	return self.db.global.test;
end

function KiNoYo_Rotation:SetTest(info, value)
	self.db.global.test = value;
end

function KiNoYo_Rotation:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	self:Print("KiNoYo_Rotation - loaded!");

	self.db = AceDB:New("KiNoYo_RotationDB", defaults, true);
	if self.db.global.enable then
		self:Enable();
	else
		self:Disable();
	end

	AceConfig:RegisterOptionsTable("KiNoYo_Rotation", options);
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("KiNoYo_Rotation");
	self:RegisterChatCommand("kinoyo", "ChatCommand");
	self:RegisterChatCommand("kny", "ChatCommand");
end

function KiNoYo_Rotation:OnEnable()
	-- Called when the addon is enabled
	self:Print("KiNoYo_Rotation - enable!");
end

function KiNoYo_Rotation:OnDisable()
	-- Called when the addon is disabled
	self:Print("KiNoYo_Rotation - disabled!");
end
