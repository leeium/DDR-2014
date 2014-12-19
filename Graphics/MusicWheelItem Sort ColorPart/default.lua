return Def.ActorFrame {
	Def.Sprite{
		InitCommand=cmd(zoomx,1.55;zoomy,1.70;setsize,370,440);
		SetMessageCommand=function(self,params)
			local so = GAMESTATE:GetSortOrder();
			local label = params.Label;
		--	if label then
			if so == "SortOrder_ModeMenu" then
				self:Load( THEME:GetPathG("MusicWheelItem","Sort ColorPart/SortBanner/"..label) );
			end;
		end;
	};
};