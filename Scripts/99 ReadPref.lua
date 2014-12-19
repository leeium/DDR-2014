-- Load Profile(GUID) or PlayerNumber
function profile_or_player(pn)
	if PROFILEMAN:IsPersistentProfile(pn) then
		return PROFILEMAN:GetProfile(pn):GetGUID();
	else
		return ToEnumShortString(pn);
	end;
end;

-- ComboGraphic
function ComboGraphic(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_ComboGraphic_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_ComboGraphic_"..profile_or_player, '2013');
		return '2013'
	else
		return readpref
	end;
end;

-- ScreenFilter
function ScreenFilter(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_ScreenFilter_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_ScreenFilter_"..profile_or_player, 'OFF');
		return 'OFF'
	else
		return readpref
	end;
end;



-- CalorieDisplay
function CalorieDisplay(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_CalorieDisplay_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_CalorieDisplay_"..profile_or_player, 'on');
		return 'on'
	else
		return readpref
	end;
end;

-- TargetScore
function TargetScore(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_TargetScore_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_TargetScore_"..profile_or_player, 'off');
		return 'off'
	else
		return readpref
	end;
end;

-- FastSlow
function FastSlow(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_FastSlow_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_FastSlow_"..profile_or_player,false);
		return false
	else
		return readpref
	end;
end;

-- PlayerOptionsAppearance
function PlayerOptionsAppearance(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_PlayerOptionsAppearance_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_"..profile_or_player, 'Off');
		return 'Off'
	else
		return readpref
	end;
end;

-- PlayerOptionsAppearance Y save
function PlayerOptionsAppearance_HidSudY(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..profile_or_player, 'Off');
		return 'Off'
	else
		return readpref
	end;
end;

-- EX Score
function EXScore(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("FirstReMIX_EXScore_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("FirstReMIX_EXScore_"..profile_or_player, 'Off');
		return 'Off'
	else
		return readpref
	end;
end;