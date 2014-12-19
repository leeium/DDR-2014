--main backing
local t = Def.ActorFrame {
	LoadActor("Item")..{
		InitCommand=cmd(zoom,0.815;y,-2;setsize,368,440);
	};
};
return t;