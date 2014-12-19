return Def.ActorFrame {
-- Load of Music play frame -- 
    LoadActor( "MusicPlay" )..{
	    InitCommand=cmd(;x,-35;y,215;zoom,1.5);
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,1.5);
		OffCommand=cmd(linear,0.2;addx,-500);
	};
	LoadActor( "BgFrame" )..{
		OnCommand=cmd(x,-45;y,-25;zoom,1.5);
		OffCommand=cmd(linear,0.2;addx,-500);
	};
	LoadActor( "BgFrame" )..{
	    InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;x,-45;y,-25;zoom,1.5);
		OnCommand=cmd(diffusealpha,1;sleep,1.2;playcommand,"Animate");
		AnimateCommand=cmd(diffuseshift;effectperiod,50);
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;playcommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(linear,0.2;addx,-500);
	};
	LoadActor( "CharactFrame" )..{
		InitCommand=cmd(diffusealpha,0;x,-38;y,-25;zoom,1.5);
		OnCommand=cmd(diffusealpha,1);
		OffCommand=cmd(linear,0.2;addx,-500);
	};
    LoadActor( "MaxStage" )..{
	    InitCommand=cmd(x,150;y,170;zoom,1.5);
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,1.5);
		OffCommand=cmd(linear,0.2;addx,-500);
	};
	LoadActor( "_selectarrow" )..{
	    InitCommand=cmd(;x,300;y,250;zoomx,-1.0);
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,0.9;playcommand,"Animate");
		AnimateCommand=cmd(bob;effectmagnitude,10,0,0;effectperiod,0.7);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoomx,-0.9;zoomy,0.9;playcommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0);
		OffCommand=cmd(diffusealpha,0);
	};
}