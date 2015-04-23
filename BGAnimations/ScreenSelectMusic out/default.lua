local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:y(SCREEN_CENTER_Y);
	end;

	---- DOOR OPEN > CLOSE  CLOSE > OPEN
		LoadActor("../2013Door01.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,-360;);
		OnCommand=cmd(linear,0.25;y,0);
	};
		LoadActor("../2013Door02.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,360;);
		OnCommand=cmd(linear,0.25;y,0);
	};
	-- Door sound
	LoadActor(THEME:GetPathS( "", "_Door" ) ) .. {
		StartTransitioningCommand=function(self)
			self:play();
		end;
	};
	--- DDR2013 LOGO  apparition > disparition ---
    LoadActor("../DDR_logo_Doors.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,0);
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
	};
};

return t