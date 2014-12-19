------------------------------------------------------------- STRIDER ---------
-- Screen Filter
function Ddr2013_Popup()
	local t = {
		Name = "Ddr2013_Popup";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
--		Choices = {"OFF", "DARK", "DARKER", "DARKEST", "BLUE LANE", "RED LANE", "GREEN LANE", "YELLOW LANE", "DARK LANE", "TOKIMEKI MIYUKI", "TOKIMEKI KAORI", "TOKIMEKI MIHO", "TOKIMEKI MAHO"};
		Choices = {"OFF", "ALICE", "BABY-LON","BONNIE", "EMI", "GUS", "JENNY", "RAGE", "ALICE2"};
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("Ddr2013_Popup_"..profileGUID) ~= nil then
					if GetUserPref("Ddr2013_Popup_"..profileGUID)=='OFF' then
						list[1] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='ALICE' then
						list[2] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='BABY-LON' then
						list[3] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='BONNIE' then
						list[4] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='EMI' then
						list[5] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='GUS' then
						list[6] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='JENNY' then
						list[7] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='RAGE' then
						list[8] = true
					elseif GetUserPref("Ddr2013_Popup_"..profileGUID)=='ALICE2' then
						list[9] = true			
					end
				else
					WritePrefToFile("Ddr2013_Popup_"..profileGUID, 'OFF');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("Ddr2013_Popup_"..pname) ~= nil then
					if GetUserPref("Ddr2013_Popup_"..pname)=='OFF' then
						list[1] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='ALICE' then
						list[2] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='BABY-LON' then
						list[3] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='BONNIE' then
						list[4] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='EMI' then
						list[5] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='GUS' then
						list[6] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='JENNY' then
						list[7] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='RAGE' then
						list[8] = true
					elseif GetUserPref("Ddr2013_Popup_"..pname)=='ALICE2' then
						list[9] = true	
					end
				else
					WritePrefToFile("Ddr2013_Popup_"..pname, 'OFF');
					list[1] = true
				end;
			end;
		end;
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='OFF';
			elseif list[2] then
				val='ALICE';
			elseif list[3] then
				val='BABY-LON';
			elseif list[4] then
				val='BONNIE';
			elseif list[5] then
				val='EMI';
			elseif list[6] then
				val='GUS';
			elseif list[7] then
				val='JENNY';
			elseif list[8] then
				val='RAGE';	
			elseif list[9] then
				val='ALICE2';		
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("Ddr2013_Popup_"..profileGUID, val);
			else
				WritePrefToFile("Ddr2013_Popup_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-------------------------------------------------------------------------- readpref.
-- STRIDER CUT IN Popup
function Popup(pn)
	local profile_or_player = profile_or_player(pn);
	local readpref = ReadPrefFromFile("Ddr2013_Popup_"..profile_or_player);
	if readpref == nil then
		WritePrefToFile("Ddr2013_Popup_"..profile_or_player, 'OFF');
		return 'OFF'
	else
		return readpref
	end;
end;