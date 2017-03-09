local AceConfig = LibStub("AceConfig-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0");
local AceConfigCmd = LibStub("AceConfigCmd-3.0");
local AceDB = LibStub("AceDB-3.0");
local AceGUI = LibStub("AceGUI-3.0");
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
	AceConfig:RegisterOptionsTable("KiNoYo_Rotation", options);
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("KiNoYo_Rotation", L["kinoyo/rotation/options/name"]);
	self:RegisterChatCommand("kinoyo", "ChatCommand");
	self:RegisterChatCommand("kny", "ChatCommand");
	self.db = AceDB:New("KiNoYo_RotationDB", defaults, true);
	if self.db.global.enable then
		self:Enable();
	else
		self:Disable();
	end
end

function KiNoYo_Rotation:OnEnable()
	-- Called when the addon is enabled
	self:Print("KiNoYo_Rotation - enable!");
	local actionsFrame = CreateFrame("frame","MyAddonFrame")
	actionsFrame:SetBackdrop({
    bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
    --edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",
    -- tile=1, tileSize=32, edgeSize=32,
    -- insets={left=11, right=12, top=12, bottom=11}
	})
	actionsFrame:SetWidth(100);
	actionsFrame:SetHeight(100);
	actionsFrame:SetPoint("CENTER",UIParent);
	actionsFrame:EnableMouse(true);
	actionsFrame:SetMovable(true);
	actionsFrame:RegisterForDrag("LeftButton");
	actionsFrame:SetScript("OnDragStart", function(self) self:StartMoving() end);
	actionsFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end);
	actionsFrame:SetFrameStrata("FULLSCREEN_DIALOG");

	local spellName = GetSpellInfo(1766);
	self:Print(spellName);
	local texture = GetSpellTexture(1766);
	local button = CreateFrame("button","MyAddonButton", actionsFrame, "UIPanelButtonTemplate");
	if nil ~= texture then
		self:Print(texture);
		-- button:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp");
	end
	button:SetHeight(32);
	button:SetWidth(32);
	button:SetPoint("BOTTOM", actionsFrame, "BOTTOM", 0, 0);
	-- button:SetText("Test")
end

function KiNoYo_Rotation:OnDisable()
	-- Called when the addon is disabled
	self:Print("KiNoYo_Rotation - disabled!");
end
