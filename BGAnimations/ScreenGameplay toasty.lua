local t = Def.ActorFrame {
	LoadActor( THEME:GetPathG("","_shigu") )..{
		InitCommand=cmd(x,SCREEN_RIGHT-150;y,SCREEN_BOTTOM-75;zoom,0.9;diffusealpha,0);
		OnCommand=cmd(decelerate,0.1;diffusealpha,1;sleep,0.6;addx,20;sleep,0.04;addx,30;sleep,0.04;addx,45;sleep,0.04;addx,60;sleep,0.04;addx,80;);
	};
	LoadActor( THEME:GetPathS("", "_toasty") ) .. {
		StartTransitioningCommand = cmd(play);
	};
}
return t
