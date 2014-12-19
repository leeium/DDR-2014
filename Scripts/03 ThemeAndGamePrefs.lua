function Player_ComboUnderField()
	return GetUserPrefB("FirstReMIX_ComboUnderField")
end
function Player_JudgmentUnderField()
	return GetUserPrefB("FirstReMIX_JudgmentUnderField")
end
function Background_ShowDancingCharacters()
	return GetUserPrefB("FirstReMIX_ShowDancingCharacters")
end

function ScreenGameplay_P1X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X-175,SCREEN_CENTER_X-160);
	else
		return WideScale(SCREEN_CENTER_X-175,SCREEN_CENTER_X-240);
	end
end
function ScreenGameplay_P2X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X+175,SCREEN_CENTER_X+160);
	else
		return WideScale(SCREEN_CENTER_X+175,SCREEN_CENTER_X+240);
	end
end

function RollingNumbersJudgment_TextFormat()
	if GAMESTATE:IsCourseMode() or (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
		return "%05.0f";
	else
		return "%04.0f";
	end;
end

-- from _fallback
-- ソングオプション用、タイトルが英語
function FirstReMIX_ComboJudgmentUnderField()
	local t = {
		Name = "FirstReMIX_ComboJudgmentUnderField";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","ComboJudgmentUnderFieldOff"),THEME:GetString("OptionNames","ComboUnderFieldOn"),THEME:GetString("OptionNames","JudgmentUnderFieldOn"),THEME:GetString("OptionNames","ComboJudgmentUnderFieldOn")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_ComboUnderField") ~= nil and ReadPrefFromFile("FirstReMIX_JudgmentUnderField") ~= nil then
				if GetUserPref("FirstReMIX_ComboUnderField")=='true' and GetUserPref("FirstReMIX_JudgmentUnderField")=='true' then
					list[4] = true
				elseif GetUserPref("FirstReMIX_ComboUnderField")=='false' and GetUserPref("FirstReMIX_JudgmentUnderField")=='true' then
					list[3] = true
				elseif GetUserPref("FirstReMIX_ComboUnderField")=='true' and GetUserPref("FirstReMIX_JudgmentUnderField")=='false' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[4] then
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
			elseif list[3] then
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
			else
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

-- アピアランス オプション（システムディレクションにもある）のComboUnderFieldを
-- 日本語タイトルに揃えるための特設項目、ソングオプションと内容は同じ
function FirstReMIX_ComboJudgmentUnderField2()
	local t = {
		Name = "FirstReMIX_ComboJudgmentUnderField2";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","ComboJudgmentUnderFieldOff"),THEME:GetString("OptionNames","ComboUnderFieldOn"),THEME:GetString("OptionNames","JudgmentUnderFieldOn"),THEME:GetString("OptionNames","ComboJudgmentUnderFieldOn")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_ComboUnderField") ~= nil and ReadPrefFromFile("FirstReMIX_JudgmentUnderField") ~= nil then
				if GetUserPref("FirstReMIX_ComboUnderField")=='true' and GetUserPref("FirstReMIX_JudgmentUnderField")=='true' then
					list[4] = true
				elseif GetUserPref("FirstReMIX_ComboUnderField")=='false' and GetUserPref("FirstReMIX_JudgmentUnderField")=='true' then
					list[3] = true
				elseif GetUserPref("FirstReMIX_ComboUnderField")=='true' and GetUserPref("FirstReMIX_JudgmentUnderField")=='false' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			local val;
			if list[4] then
				val = true;
				WritePrefToFile("FirstReMIX_ComboUnderField",val);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",val);
			elseif list[3] then
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
			else
				val = false;
				WritePrefToFile("FirstReMIX_ComboUnderField",val);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",val);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

-- from _fallback
-- ソングオプション用、タイトルが英語
function GamePrefDefaultFail()
	local t = {
		Name = "GamePrefDefaultFail";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","DefaultFailImmediate"),THEME:GetString("OptionNames","DefaultFailOff")};
		LoadSelections = function(self, list, pn)
			if ReadGamePrefFromFile("DefaultFail") ~= nil then
				if GetGamePref("DefaultFail") then
					if GetGamePref("DefaultFail") == "Immediate" then
						list[1] = true;
					elseif GetGamePref("DefaultFail") == "Off" then
						list[2] = true;
					else
						list[1] = true;
					end
					-- list[table.find( list, GetGamePref("DefaultFail") )] = true;
				else
					list[1] = true;
				end;
			else
				WriteGamePrefToFile("DefaultFail","Immediate");
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			-- This is so stupid.
			local tChoices = { "Immediate","Off" };
			local val;
			if list[1] then
				val = tChoices[1];
			elseif list[2] then
				val = tChoices[2];
			else
				val = tChoices[1];
			end
			WriteGamePrefToFile("DefaultFail",val);
			MESSAGEMAN:Broadcast("PreferenceSet", { Message == "Set Preference" } );
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

-- アドバンスド オプション（システムディレクションにもある）のGamePrefDefaultFailを
-- 日本語タイトルに揃えるための特設項目、ソングオプションと内容は同じ
function GamePrefDefaultFail2()
	local t = {
		Name = "GamePrefDefaultFail2";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","DefaultFailImmediate"),THEME:GetString("OptionNames","DefaultFailOff")};
		LoadSelections = function(self, list, pn)
			if ReadGamePrefFromFile("DefaultFail") ~= nil then
				if GetGamePref("DefaultFail") then
					if GetGamePref("DefaultFail") == "Immediate" then
						list[1] = true;
					elseif GetGamePref("DefaultFail") == "Off" then
						list[2] = true;
					else
						list[1] = true;
					end
					-- list[table.find( list, GetGamePref("DefaultFail") )] = true;
				else
					list[1] = true;
				end;
			else
				WriteGamePrefToFile("DefaultFail","Immediate");
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			-- This is so stupid.
			local tChoices = { "Immediate","Off" };
			local val;
			if list[1] then
				val = tChoices[1];
			elseif list[2] then
				val = tChoices[2];
			else
				val = tChoices[1];
			end
			WriteGamePrefToFile("DefaultFail",val);
			MESSAGEMAN:Broadcast("PreferenceSet", { Message == "Set Preference" } );
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

-- Meter ScreenOptionsSystemDirection
function FirstReMIX_DifficultyMeter()
	local t = {
		Name = "FirstReMIX_DifficultyMeter";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","10Meter"),THEME:GetString("OptionNames","20Meter"),THEME:GetString("OptionNames","NormalMeter")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_DifficultyMeter") ~= nil then
				if GetUserPref("FirstReMIX_DifficultyMeter") == "10Meter" then
					list[1] = true
				elseif GetUserPref("FirstReMIX_DifficultyMeter") == "20Meter" then
					list[2] = true
				elseif GetUserPref("FirstReMIX_DifficultyMeter") == "NormalMeter" then
					list[3] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_DifficultyMeter","10Meter");
				list[1] = true
			end;
		end;
		SaveSelections = function(self, list, pn)
			local tChoices = { "10Meter","20Meter","NormalMeter" };
			local val;
			if list[1] then
				val = tChoices[1];
			elseif list[2] then
				val = tChoices[2];
			elseif list[3] then
				val = tChoices[3];
			else
				val = tChoices[1];
			end
			WritePrefToFile("FirstReMIX_DifficultyMeter",val);
		end;
	};
	setmetatable( t, t );
	return t;
end

-- PlayerOptions Appearance Test
function FirstReMIX_PlayerOptionsAppearance()
	local t = {
		Name = "FirstReMIX_PlayerOptionsAppearance";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","Visible"),THEME:GetString("OptionNames","Hidden"),THEME:GetString("OptionNames","Sudden"),THEME:GetString("OptionNames","Stealth"),THEME:GetString("OptionNames","HiddenPlus"),THEME:GetString("OptionNames","SuddenPlus"),THEME:GetString("OptionNames","HiddenSuddenPlus")};
		LoadSelections = function(self, list, pn)
			local HidSud;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if GAMESTATE:PlayerIsUsingModifier(pn,'hidden') then
					list[2] = true
					HidSud = "Hidden"
				elseif GAMESTATE:PlayerIsUsingModifier(pn,'sudden') then
					list[3] = true
					HidSud = "Sudden"
				elseif GAMESTATE:PlayerIsUsingModifier(pn,'stealth') then
					list[4] = true
					HidSud = "Stealth"
				else
					if ReadPrefFromFile("FirstReMIX_PlayerOptionsAppearance_"..profileGUID) ~= nil then
						if GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. profileGUID)=='HiddenPlus' then
							list[5] = true
							HidSud = "HiddenPlus"
						elseif GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. profileGUID)=='SuddenPlus' then
							list[6] = true
							HidSud = "SuddenPlus"
						elseif GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. profileGUID)=='HiddenSuddenPlus' then
							list[7] = true
							HidSud = "HiddenSuddenPlus"
						else
							list[1] = true
							HidSud = "Visible"
						end						
					else
						list[1] = true
						HidSud = "Visible"
					end;
				end;
			else
				if GAMESTATE:PlayerIsUsingModifier(pn,'hidden') then
					list[2] = true
					HidSud = "Hidden"
				elseif GAMESTATE:PlayerIsUsingModifier(pn,'sudden') then
					list[3] = true
					HidSud = "Sudden"
				elseif GAMESTATE:PlayerIsUsingModifier(pn,'stealth') then
					list[4] = true
					HidSud = "Stealth"
				else
					if ReadPrefFromFile("FirstReMIX_PlayerOptionsAppearance_"..pname) ~= nil then
						if GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. pname)=='HiddenPlus' then
							list[5] = true
							HidSud = "HiddenPlus"
						elseif GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. pname)=='SuddenPlus' then
							list[6] = true
							HidSud = "SuddenPlus"
						elseif GetUserPref("FirstReMIX_PlayerOptionsAppearance_" .. pname)=='HiddenSuddenPlus' then
							list[7] = true
							HidSud = "HiddenSuddenPlus"
						else
							list[1] = true
							HidSud = "Visible"
						end						
					else
						list[1] = true
						HidSud = "Visible"
					end;
				end;
			end;
			setenv("HidSud"..pname,HidSud);
		end;
		SaveSelections = function(self, list, pn)
			local ps = GAMESTATE:GetPlayerState(pn);
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			local get = getenv("HidSud"..pname);
			if list[1] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "visible");
				val='Visible';
			elseif list[2] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "hidden");
				val='Hidden';
			elseif list[3] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "sudden");
				val='Sudden';
			elseif list[4] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "stealth");
				val='Stealth';
			elseif list[5] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "visible");
				val='HiddenPlus';
			elseif list[6] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "visible");
				val='SuddenPlus';
			elseif list[7] then
				ps:SetPlayerOptions("ModsLevel_Preferred", "visible");
				val='HiddenSuddenPlus';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_"..profileGUID, val);
				if list[1] or list[2] or list[3] or list[4] or val ~= get then
					WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..profileGUID,"Off");
				end;
			else
				WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_"..pname, val);
				if list[1] or list[2] or list[3] or list[4] or val ~= get then
					WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..pname,"Off");
				end;
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

--　Base Graphics test
function FirstReMIX_BaseGraphics()
	local t = {
		Name = "FirstReMIX_BaseGraphics";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"DEFAULT","2013"};
	--	Choices = {"2013"};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_BaseGraphics") ~= nil then
		--		if GetUserPref("FirstReMIX_BaseGraphics") == "default" then
				if GetUserPref("FirstReMIX_BaseGraphics") == "2013" then
					list[1] = true
	--[[			elseif GetUserPref("FirstReMIX_BaseGraphics") == "2013" then
					list[2] = true
				else
					list[1] = true ]]--
				end
			else
			--	WritePrefToFile("FirstReMIX_BaseGraphics","default");
				WritePrefToFile("FirstReMIX_BaseGraphics","2013");
				list[1] = true
			end;
		end;
		SaveSelections = function(self, list, pn)
		--	local tChoices = {"DEFAULT","2013"};
			local tChoices = {"2013"};
			local val;
			if list[1] then
				val = tChoices[1];
			elseif list[2] then
				val = tChoices[2];
			else
				val = tChoices[1];
			end
			WritePrefToFile("FirstReMIX_BaseGraphics",val);
		end;
	};
	setmetatable( t, t );
	return t;
end