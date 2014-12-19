local t = Def.ActorFrame {};
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

-- Door
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:y(SCREEN_CENTER_Y);
		if GAMESTATE:IsExtraStage() then
			self:diffuse(color("#ff5aec"));
		elseif GAMESTATE:IsExtraStage2() then
			self:diffuse(color("#ff5a63"));
		end;
	end;
	--- Load Background Doors Song Frame ---
	LoadActor("../StageinBG.png")..{
		InitCommand=cmd(zoomx,1.1;diffusealpha,0;x,SCREEN_CENTER_X;y,0);
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
-- CDImage
t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		local song=GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:LoadBackground(song:GetCDImagePath());
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(song:GetCDImagePath());
		end;
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y+80);
		self:zoom_to_banner();
	end;
	OnCommand=function(self)
		self:addy(-SCREEN_HEIGHT);
		self:linear(0.25);
		self:addy(SCREEN_HEIGHT);
	end;
};
t[#t+1] = Def.Banner{
	InitCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:LoadBackground(GetJacketBanner(song));
		elseif not GAMESTATE:IsCourseMode() then
			self:LoadBackground(GetJacketBanner(song));
			------------- position  SQUARE BANNER -------
			if self:GetWidth() == self:GetHeight() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-15);
			else
			------------ POSITION ONG RECTANGLE BANNER-----
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-150);
			end;
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(GetJacketBanner(song));
			if song:HasCDImage() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y);
				
			else
			--------------- position of square banner
				if self:GetWidth() == self:GetHeight() then
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-30);
					---------------------------------------
				else
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-100);
				end;
			end;
		end;
--		self:scale_to_clip_banner();
        self:diffuse(color("#000000"));
        self:diffusealpha(0);
        self:banner_scale_stage_line();
	end;

    OnCommand=function(self)
		self:zoom(5);
		self:sleep(1.90);
		self:linear(0.25);
		self:diffusealpha(1);
		self:zoom(0.75);
		self:linear(0.1);
		self:banner_scale_stage_line();
	end;
};
t[#t+1] = Def.Banner{
	InitCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:LoadBackground(GetJacketBanner(song));
		elseif not GAMESTATE:IsCourseMode() then
			self:LoadBackground(GetJacketBanner(song));
			------------- position  SQUARE BANNER -------
			if self:GetWidth() == self:GetHeight() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-15);
			else
			------------ POSITION ONG RECTANGLE BANNER-----
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-150);
			end;
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(GetJacketBanner(song));
			if song:HasCDImage() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y);	
			else
				if self:GetWidth() == self:GetHeight() then
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-30);
					---------------------------------------
				else
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-100);
				end;
			end;
		end;
        self:diffusealpha(0);
        self:banner_scale_stage();
	end;
    OnCommand=function(self)
		self:zoom(5);
		self:sleep(1.90);
		self:linear(0.25);
		self:diffusealpha(1);
		self:zoom(0.75);
		self:linear(0.1);
		self:banner_scale_stage();
	end;
};
t[#t+1] = LoadActor("StageDisplay") .. {
};	


return t