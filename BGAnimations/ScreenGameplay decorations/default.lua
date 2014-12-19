local t = LoadFallbackB()
t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP2","ScoreFrameP2");
t[#t+1] = StandardDecorationFromFileOptional("SongFrame","SongFrame");
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("StageFrame","StageFrame");
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SongTitle","SongTitle");
local customscore=GetCustomScoreMode();
 local cscore="SuperNOVA2";
 if not GAMESTATE:IsCourseMode() then
 local stepcnt={0,0}
 t[#t+1] = Def.Actor{
     JudgmentMessageCommand = function(self, params)
         if params.TapNoteScore and
          params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
          params.TapNoteScore ~= 'TapNoteScore_HitMine' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
          params.TapNoteScore ~= 'TapNoteScore_None'
         then
             if customscore=="old" then
                 Scoring[scoreType](params, 
                     STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
             elseif customscore=="5b2" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             elseif customscore=="5b1" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b1(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             else
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5a2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             end;
         end
     end;
     InitCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Init();
         end;
     end;
     OffCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Out();
         end;
     end;
 };
 end;
t[#t+1] = LoadActor("Frame1.png")..{
		InitCommand=cmd(player,PLAYER_1;horizalign,left;x,SCREEN_LEFT;draworder,49);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-301.5);
				self:rotationx(180);
			else
				self:y(SCREEN_CENTER_Y+275);
			end;
		end;
	};
t[#t+1] = LoadActor("Frame2.png")..{
		InitCommand=cmd(player,PLAYER_2;horizalign,right;x,SCREEN_RIGHT;draworder,49);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:y(SCREEN_CENTER_Y-301.5);
				self:rotationx(180);
			else
				self:y(SCREEN_CENTER_Y+275);
			end;
		end;
	};
--CaloriesP1--
--BigNumber--
local pn = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,right;settext,"0000";x,SCREEN_CENTER_X-370+10;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#fff200"));
			StepMessageCommand=function(self)
				local pssp1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
				local CaloriesBurnedP1 = pssp1:GetCaloriesBurned();
				self:settextf("%04.3f",CaloriesBurnedP1)
			end;
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:y(SCREEN_CENTER_Y-306.5);
				else
					self:y(SCREEN_CENTER_Y+271.5);
			end;
		end;
	};
--kcal--
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,left;settext,"kcal";x,SCREEN_CENTER_X-370+20;y,SCREEN_CENTER_Y+271+2;draworder,50;diffuse,color("#fff200");zoom,0.85);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:y(SCREEN_CENTER_Y-305);
				else
					self:y(SCREEN_CENTER_Y+271+2);
			end;
		end;
	};
--CaloriesP2--
--BigNumber--
local pn = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,right;settext,"0000";x,SCREEN_CENTER_X+370+30-15;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#fff200"));
			StepMessageCommand=function(self)
				local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
				local CaloriesBurnedP2 = pssp2:GetCaloriesBurned();
				self:settextf("%04.3f",CaloriesBurnedP2)
			end;
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y-306.5);
				else
					self:y(SCREEN_CENTER_Y+271.5);
			end;
		end;
	};
--kcal--
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,left;settext,"kcal";x,SCREEN_CENTER_X+370+10+30-15;y,SCREEN_CENTER_Y+271+2;draworder,50;diffuse,color("#fff200");zoom,0.85);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y-305);
				else
					self:y(SCREEN_CENTER_Y+271+2);
			end;
		end;
	};
--options--
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X-221,SCREEN_CENTER_X-296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X+221,SCREEN_CENTER_X+296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};
--songinfo--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-170;y,SCREEN_BOTTOM-58-11;zoom,1;draworder,50;strokecolor,color("#000000"));
	OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.25;diffusealpha,1);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local text = song:GetDisplayMainTitle();
		self:diffusealpha(1);
		self:maxwidth(340);
		self:settext(text);
	end;
};
--artist--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-170;y,SCREEN_BOTTOM-58+11;zoom,0.8;draworder,50;strokecolor,color("#000000"));
	OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.25;diffusealpha,1);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local text = song:GetDisplayArtist();
		self:diffusealpha(1);
		self:maxwidth(340);
		self:settext(text);
	end;
};
		
return t