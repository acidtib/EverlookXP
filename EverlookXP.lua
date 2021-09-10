-- Configuration settings
-- Default values
XP_Rate = "5";
XP_Weekend_Rate = "7";
Accepted_Realm = "Dunemaul"
Player_Language = GetDefaultLanguage("PLAYER");
General_Channel = 1;

-- Values for private use
XP_Set = false;
Current_Realm = GetRealmName()


local frame = CreateFrame("Frame");

frame:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
frame:SetScript("OnEvent", function(frame, event)
  if ( XP_Set == false and Current_Realm == Accepted_Realm ) then
		XP_Set = true;

    ChatFrame1:AddMessage("EverlookXP: Setting XP Rate to "..XP_Rate.."x on realm "..Current_Realm);
			
		SendChatMessage(".mod xprate "..XP_Rate, "CHANNEL", Player_Language, General_Channel);
		SendChatMessage(".mod xprate "..XP_Weekend_Rate, "CHANNEL", Player_Language, General_Channel);
	end
end)
