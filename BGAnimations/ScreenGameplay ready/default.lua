return Def.ActorFrame {
    LoadActor( "ready" ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(zoomy,0;zoomx,1.34;accelerate,0.133;zoomy,0.807;zoomx,1;decelerate,0.066;zoomy,1.192;sleep,0.016;accelerate,0.033;glow,1,1,1,0;zoomy,1;sleep,1.078;decelerate,0.132;zoomy,0;zoomx,1.14;diffusealpha,0;);
    };
};	
