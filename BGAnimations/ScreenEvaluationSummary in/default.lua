return Def.ActorFrame {
	OnCommand=cmd(sleep,0);
	LoadActor("../_swoosh_in")..{
		OnCommand=cmd(play);
	};
};