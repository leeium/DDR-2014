local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;
----------------------------------------------------------------------------
return Def.ActorFrame {
--- STAGE FRAME APPARITION > DISPARITION ---
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;sleep,3.2;addx,-600;diffusealpha,1;linear,0.2;addx,600;sleep,0.01;zoom,1.3;linear,0.1;zoom,1;);
	};
	
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;sleep,3.2;addx,600;diffusealpha,1;linear,0.2;addx,-600;sleep,0.01;zoom,1.3;linear,0.1;zoom,1;);
	};
	
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_Add';zoom,1.3);
		OnCommand=cmd(diffusealpha,0;sleep,3.2;linear,0.25;diffusealpha,1;sleep,0.01;zoom,1.3;linear,0.13;zoom,1;linear,0.1;diffusealpha,0;sleep,3);
	};
	--[[
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.000;sleep,3;diffusealpha,0;zoom,1;addx,600;linear,0.2;zoomx,1;addx,-600;linear,0.1;diffusealpha,1;linear,0.5;zoom,1;diffusealpha,0;);
	}; ]]--
	
};