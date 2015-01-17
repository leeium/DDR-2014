local t = Def.ActorFrame {
LoadActor(THEME:GetPathB("","StageinBG"))..{
	InitCommand=cmd(diffusealpha,0.15;FullScreen);
	};
};
return t