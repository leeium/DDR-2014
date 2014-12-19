local x = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,80;diffuse,color("0,0,0,0.0"));
		OnCommand=cmd(smooth,0.2;diffuse,color("0,0,0,0.5"));
		OffCommand=cmd(smooth,0.2;diffuse,color("0,0,0,0.0"));
	};
	LoadFont("Common Normal")..{
		Text=ScreenString("Saving Profiles");
		InitCommand=cmd(Center;diffuse,color("1,1,1,1");shadowlength,1);
		OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0.5); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;