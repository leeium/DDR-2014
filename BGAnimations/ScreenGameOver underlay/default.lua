return Def.ActorFrame{

	LoadActor("background.png")..{
		InitCommand=cmd(FullScreen);
	};
};