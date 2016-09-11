-- locals and speed
local AddonName, Addon = ...;

local _G = _G;
local pairs = pairs;
local select = select;

local NUM_ACTIONBAR_BUTTONS = NUM_ACTIONBAR_BUTTONS or 12;

-- main
function Addon:Load()
  do
    local eventHandler = CreateFrame('Frame', nil);

    -- set OnEvent handler
    eventHandler:SetScript('OnEvent', function(handler, ...)
        self:OnEvent(...);
      end)

    eventHandler:RegisterEvent('PLAYER_LOGIN');
  end
end

-- frame events
function Addon:OnEvent(event, ...)
  local action = self[event];

  if (action) then
    action(self, event, ...);
  end
end

-- hooks
do
  local function Frame_UpdateAnchors(frame)
    Addon:UpdateAnchors(frame);
  end

  function Addon:HookActionEvents()
    hooksecurefunc(AlertFrame, 'UpdateAnchors', Frame_UpdateAnchors);
  end
end

function Addon:UpdateAnchors(frame)
  frame:ClearAllPoints();
  frame:SetPoint('CENTER', UIParent, 'TOP', 0, 0);
end

function Addon:DarkenTextures()
  for _, texture in pairs({
      -- unit frames
      PlayerFrameTexture,
      TargetFrameTextureFrameTexture,
      PetFrameTexture,
      PartyMemberFrame1Texture,
      PartyMemberFrame2Texture,
      PartyMemberFrame3Texture,
      PartyMemberFrame4Texture,
      PartyMemberFrame1PetFrameTexture,
      PartyMemberFrame2PetFrameTexture,
      PartyMemberFrame3PetFrameTexture,
      PartyMemberFrame4PetFrameTexture,
      FocusFrameTextureFrameTexture,
      TargetFrameToTTextureFrameTexture,
      FocusFrameToTTextureFrameTexture,
      BonusActionBarFrameTexture0,
      BonusActionBarFrameTexture1,
      BonusActionBarFrameTexture2,
      BonusActionBarFrameTexture3,
      BonusActionBarFrameTexture4,
      Boss1TargetFrameTextureFrameTexture,
      Boss2TargetFrameTextureFrameTexture,
      Boss3TargetFrameTextureFrameTexture,
      Boss4TargetFrameTextureFrameTexture,
      Boss5TargetFrameTextureFrameTexture,
      Boss1TargetFrameSpellBarBorder,
      Boss2TargetFrameSpellBarBorder,
      Boss3TargetFrameSpellBarBorder,
      Boss4TargetFrameSpellBarBorder,
      Boss5TargetFrameSpellBarBorder,
      CastingBarFrameBorder,
      FocusFrameSpellBarBorder,
      TargetFrameSpellBarBorder,
      RuneButtonIndividual1BorderTexture,
      RuneButtonIndividual2BorderTexture,
      RuneButtonIndividual3BorderTexture,
      RuneButtonIndividual4BorderTexture,
      RuneButtonIndividual5BorderTexture,
      RuneButtonIndividual6BorderTexture,
      PaladinPowerBarBG,
      PaladinPowerBarBankBG,
      -- main menu
      SlidingActionBarTexture0,
      SlidingActionBarTexture1,
      MainMenuBarLeftEndCap,
      MainMenuBarRightEndCap,
      MainMenuBarTexture0,
      MainMenuBarTexture1,
      MainMenuBarTexture2,
      MainMenuBarTexture3,
      MainMenuMaxLevelBar0,
      MainMenuMaxLevelBar1,
      MainMenuMaxLevelBar2,
      MainMenuMaxLevelBar3,
      MainMenuXPBarTextureLeftCap,
      MainMenuXPBarTextureRightCap,
      MainMenuXPBarTextureMid,
      MainMenuXPBarDiv1,
      MainMenuXPBarDiv2,
      MainMenuXPBarDiv3,
      MainMenuXPBarDiv4,
      MainMenuXPBarDiv5,
      MainMenuXPBarDiv6,
      MainMenuXPBarDiv7,
      MainMenuXPBarDiv8,
      MainMenuXPBarDiv9,
      MainMenuXPBarDiv10,
      MainMenuXPBarDiv11,
      MainMenuXPBarDiv12,
      MainMenuXPBarDiv13,
      MainMenuXPBarDiv14,
      MainMenuXPBarDiv15,
      MainMenuXPBarDiv16,
      MainMenuXPBarDiv17,
      MainMenuXPBarDiv18,
      MainMenuXPBarDiv19,
      ReputationWatchBar.StatusBar.XPBarTexture0,
      ReputationWatchBar.StatusBar.XPBarTexture1,
      ReputationWatchBar.StatusBar.XPBarTexture2,
      ReputationWatchBar.StatusBar.XPBarTexture3,
      ReputationWatchBarTexture0,
      ReputationWatchBarTexture1,
      ReputationWatchBarTexture2,
      ReputationWatchBarTexture3,
      ReputationXPBarTexture0,
      ReputationXPBarTexture1,
      ReputationXPBarTexture2,
      ReputationXPBarTexture3,
      ReputationWatchBar.StatusBar.WatchBarTexture0,
      ReputationWatchBar.StatusBar.WatchBarTexture1,
      ReputationWatchBar.StatusBar.WatchBarTexture2,
      ReputationWatchBar.StatusBar.WatchBarTexture3,
      StanceBarLeft,
      StanceBarMiddle,
      StanceBarRight,
      -- arena frames
      ArenaEnemyFrame1Texture,
      ArenaEnemyFrame2Texture,
      ArenaEnemyFrame3Texture,
      ArenaEnemyFrame4Texture,
      ArenaEnemyFrame5Texture,
      ArenaEnemyFrame1SpecBorder,
      ArenaEnemyFrame2SpecBorder,
      ArenaEnemyFrame3SpecBorder,
      ArenaEnemyFrame4SpecBorder,
      ArenaEnemyFrame5SpecBorder,
      ArenaEnemyFrame1PetFrameTexture,
      ArenaEnemyFrame2PetFrameTexture,
      ArenaEnemyFrame3PetFrameTexture,
      ArenaEnemyFrame4PetFrameTexture,
      ArenaEnemyFrame5PetFrameTexture,
      ArenaPrepFrame1Texture,
      ArenaPrepFrame2Texture,
      ArenaPrepFrame3Texture,
      ArenaPrepFrame4Texture,
      ArenaPrepFrame5Texture,
      ArenaPrepFrame1SpecBorder,
      ArenaPrepFrame2SpecBorder,
      ArenaPrepFrame3SpecBorder,
      ArenaPrepFrame4SpecBorder,
      ArenaPrepFrame5SpecBorder,
      -- panes
      CharacterFrameTitleBg,
      CharacterFrameBg,
      ObjectiveTrackerBlocksFrame.QuestHeader.Background,
      -- minimap
      MinimapBorder,
      MinimapBorderTop,
      MiniMapTrackingButtonBorder,
      MiniMapLFGFrameBorder,
      MiniMapBattlefieldBorder,
      MiniMapMailBorder,
      -- raid frame
      CompactRaidFrameContainerBorderFrameBorderTopLeft,
      CompactRaidFrameContainerBorderFrameBorderTop,
      CompactRaidFrameContainerBorderFrameBorderTopRight,
      CompactRaidFrameContainerBorderFrameBorderRight,
      CompactRaidFrameContainerBorderFrameBorderBottomRight,
      CompactRaidFrameContainerBorderFrameBorderBottom,
      CompactRaidFrameContainerBorderFrameBorderBottomLeft,
      CompactRaidFrameContainerBorderFrameBorderLeft,
      select(1, MinimapZoomIn:GetRegions()),
      select(3, MinimapZoomIn:GetRegions()),
      select(1, MinimapZoomOut:GetRegions()),
      select(3, MinimapZoomOut:GetRegions()),
      QueueStatusMinimapButtonBorder,
      select(1, TimeManagerClockButton:GetRegions())
    }) do
    texture:SetVertexColor(.3, .3, .3);
  end

  -- clock text font
  for _, font in pairs({
      select(2, TimeManagerClockButton:GetRegions())
    }) do
    font:SetVertexColor(1, 1, 1);
  end
end

function Addon:ApplyNameBackgroundTexture()
  for _, background in pairs({
      PlayerFrameNameBackground,
      TargetFrameNameBackground,
      FocusFrameNameBackground
    }) do
    background:SetTexture('Interface\\TargetingFrame\\UI-StatusBar');
  end
end

function Addon:SetFontColors(r, g, b)
  GameFontNormalSmall:SetTextColor(r, g, b);
end

do
  local function StyleActionButton(button)
    if (not button) then return end

    local name = button:GetName();
    local icon = _G[name..'Icon'];

    -- cut the default border of the icon
    icon:SetTexCoord(.06, .94, .06, .94);
  end

  function Addon:StyleActionButtons()
    for i = 1, NUM_ACTIONBAR_BUTTONS do
      for _, v in pairs({
          'ActionButton',
          'MultiBarBottomLeftButton',
          'MultiBarBottomRightButton',
          'MultiBarRightButton',
          'MultiBarLeftButton'
        }) do
        local button = _G[v..i];
        StyleActionButton(button);
      end
    end
  end
end

function Addon:PLAYER_LOGIN()
  self:HookActionEvents();
  self:DarkenTextures();
  self:ApplyNameBackgroundTexture();
  self:SetFontColors(1, 1, 1);
  self:StyleActionButtons();

  -- show/hide friendly/enemy player names/guild/titles
  SetCVar('UnitNameFriendlyPlayerName', 1);
  SetCVar('UnitNameEnemyPlayerName', 1);
  -- SetCVar('UnitNameOwn', 1);
  SetCVar('UnitNamePlayerPVPTitle', 0);
  SetCVar('UnitNamePlayerGuild', 0);
  SetCVar('UnitNameGuildTitle', 0);
end

-- call
Addon:Load();
