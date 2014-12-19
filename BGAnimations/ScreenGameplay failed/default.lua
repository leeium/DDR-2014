local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	OnCommand=function(self)
		if GAMESTATE:IsExtraStage() then
			self:diffuse(color("#ff5aec"));
		elseif GAMESTATE:IsExtraStage2() then
			self:diffuse(color("#ff5a63"));
		end;
	end;
	-- failed song --
    LoadActor("../_failed.mp3") .. {
		StartTransitioningCommand=cmd(play);
	};
	-- DOOR OPEN TO CLOSE
    LoadActor("../2013Door01.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-360;zoom,1.01);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y);
	};
    LoadActor("../2013Door02.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+360;zoom,1.01);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y);
	};
};

t[#t+1] = Def.ActorFrame {	
	-- Failed 
	LoadActor("failed") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
};

return t;