local t = Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_swoosh normal") ) .. {
		StartTransitioningCommand=cmd(play);
	};
	---- DOOR OPEN > CLOSE  CLOSE > OPEN
	LoadActor(THEME:GetPathB("","2013Door01.png"))..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(sleep,0.25;linear,0.25;y,SCREEN_CENTER_Y-360;);
    };
	LoadActor(THEME:GetPathB("","2013Door02.png"))..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(sleep,0.25;linear,0.25;y,SCREEN_CENTER_Y+360;);
    };
		LoadActor("Score.mp3")..{
		StartTransitioningCommand=cmd(stop;sleep,0.5;play);
	};

};
return t;
