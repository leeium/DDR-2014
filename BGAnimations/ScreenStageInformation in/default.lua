local playMode = GAMESTATE:GetPlayMode()
if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
	curStage = playMode;
end;
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

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:y(SCREEN_CENTER_Y);
	end;
	--- Load Background Doors Song Frame ---
	LoadActor("../StageinBG.png")..{
		InitCommand=cmd(FullScreen;diffusealpha,0;x,SCREEN_CENTER_X;y,0);
		OnCommand=cmd(sleep,1;linear,0.5;diffusealpha,1;sleep,3.5);
	};
	---- DOOR OPEN > CLOSE  CLOSE > OPEN
		LoadActor("../2013Door01.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,-360;);
		OnCommand=cmd(linear,0.25;y,0;sleep,1.80;linear,0.45;y,-360);
	};
		LoadActor("../2013Door02.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,360;);
		OnCommand=cmd(linear,0.25;y,0;sleep,1.80;linear,0.45;y,360);
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
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1;sleep,1.50;linear,0.25;diffusealpha,0);
	};
	--- Flash SONG BANNER  sound------
	LoadActor("SoundStage") .. {
	};
	--- Flash SONG BANNER
	LoadActor("../flashsongbanner.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,0;diffusealpha,0);
		OnCommand=cmd(zoom,0.3;sleep,2.5;diffusealpha,0.5;linear,0.45;zoom,5;diffusealpha,0);
	};
};
t[#t+1] = Def.Quad{
	OnCommand=cmd(diffuse,color("#000000");Center;setsize,326,326;diffusealpha,0;zoom,4;sleep,1.9;linear,0.2;diffusealpha,1;zoom,1);
	};
if not GAMESTATE:IsCourseMode() then
--song jacket--
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(playcommand,'Set';Center;diffusealpha,0;zoom,4;sleep,1.9;linear,0.2;diffusealpha,1;zoom,1;sleep,3;diffusealpha,1);
	Def.Sprite {
		SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song:HasJacket() then
				self:LoadBackground(song:GetJacketPath());
				self:setsize(320,320);
			elseif song:HasBackground() then
				self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
				self:setsize(320,320);
			else
				self:Load(THEME:GetPathG("","Common fallback jacket"));
				self:setsize(320,320);
			end;
		end;
	};
};
else
t[#t+1] = LoadActor("CourseDisplay");
end;
t[#t+1] = LoadActor("StageDisplay");


return t