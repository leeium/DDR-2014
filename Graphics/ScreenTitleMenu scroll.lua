local gc = Var("GameCommand");

local colours= {
		["GAME MODE"]= "#fad300",
		["TRAINING MODE"]= "#29e923",
		["EDIT MODE"]= "#ee32fe",
		["OPTIONS"]= "#30d7fe",
		["EXIT"]= "#ff1c3b",
	}
local color_str= colours[gc:GetText()] or "#000000"

return Def.ActorFrame {
	LoadFont("Common Normal") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText());
--[[ 		EnabledCommand=function(self)
			if string.find( THEME:GetMetric( Var "LoadingScreen", "DisabledChoices") , gc:GetText() ) ~= nil then
				self:diffuse(Color("Red"));
			end
		end; --]]
		OnCommand=cmd(strokecolor,Color("Black"));
		GainFocusCommand=cmd(stoptweening;linear,0.125;zoom,1;diffuse,color("#ffffff"));
--[[ 		GainFocusCommand=function(self)
			if string.find( tostring( THEME:GetMetric( Var "LoadingScreen", "DisabledChoices") ) , gc:GetText() ) ~= nil then
				self:zoom(1);
				self:diffuse(Color("Red"));
			else
				self:zoom(1);
				self:diffuse(Color("White"));
			end
		end; --]]
		LoseFocusCommand=cmd(stoptweening;linear,0.125;zoom,0.75;diffuse,color(color_str));
	};
};