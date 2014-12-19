local t = Def.ActorFrame {
	LoadActor("Header") .. {
		InitCommand=cmd(FullScreen);
	};
};
return t;