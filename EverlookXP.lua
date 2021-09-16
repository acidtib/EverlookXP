EverlookXP = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0")

function EverlookXP:OnInitialize()
  -- Configuration settings
  -- Default values
  XP_Rate = "5";
  XP_Weekend_Rate = "7";
  Accepted_Realm = "Dunemaul";
  Player_Language = GetDefaultLanguage("PLAYER");
  General_Channel = 1;

  -- Values for private use
  XP_Set = false;
  Current_Realm = GetRealmName();
end

function EverlookXP:OnEnable()
  self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
  self:RegisterEvent("CHAT_MSG_SYSTEM")
end

function EverlookXP:OnDisable()

end

-- handle player joining chat channel
function EverlookXP:CHAT_MSG_CHANNEL_NOTICE()
  -- check that we have the correct realm
  -- check if player joined the general channel
  if event == "CHAT_MSG_CHANNEL_NOTICE" and Current_Realm == Accepted_Realm and arg1 == "YOU_JOINED" and arg8 == General_Channel and XP_Set == false then
    EverlookXP:Say("EverlookXP: Setting XP Rate to "..XP_Rate.."x on realm "..Current_Realm)

    -- try to set XP_Weekend_Rate
    EverlookXP:Set_XP(XP_Weekend_Rate)
  end
end

-- handle client receiving a system message
function EverlookXP:CHAT_MSG_SYSTEM()
  -- check that we have the correct realm
  -- check that if XP_Weekend_Rate failed
  if event == "CHAT_MSG_SYSTEM" and Current_Realm == Accepted_Realm and string.find(arg1, "5!") then
    -- set XP_Rate
    EverlookXP:Set_XP(XP_Rate)
  end
end

function EverlookXP:Say(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

function EverlookXP:Set_XP(rate)
  -- send xprate command to general channel
  SendChatMessage(".mod xprate "..rate, "CHANNEL", Player_Language, General_Channel);
end