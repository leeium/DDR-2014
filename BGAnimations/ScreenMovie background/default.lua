return Def.ActorFrame {
	LoadActor( "background" )..{
		InitCommand=cmd(FullScreen);
	};
	LoadActor( "music" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};
}