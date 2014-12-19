local t = Def.ActorFrame {};

t[#t+1] = LoadActor("bar") .. {
	InitCommand=cmd();
	OnCommand=cmd(zoomx,0.6;linear,0.2;zoomy,0.75);
	OffCommand=cmd(linear,0.2;zoomy,0);
};

return t