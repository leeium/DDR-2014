return Def.ActorFrame {
	OnCommand=cmd(sleep,1);
	LoadActor("../_evalOut")..{
		OffCommand=cmd(play);
	};
};