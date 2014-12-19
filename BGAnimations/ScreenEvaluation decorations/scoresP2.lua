local t = Def.ActorFrame {};
-- Holy fcuk yes it's finally working (inefficient as it may be)
local function RivalScore(pn,rival)
local t=Def.ActorFrame {
InitCommand=cmd(addy,-30+3);
	LoadFont("Common normal")..{
		InitCommand=cmd(zoom,0.8;shadowlength,2;x,SCREEN_CENTER_X+245-135;y,SCREEN_CENTER_Y+80+4;horizalign,left;diffuse,color("White");strokecolor,color("#000000"));
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
					name = profile:GetDisplayName();
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
					name = "STEP";
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist)
				local scores = scorelist:GetHighScores();
				local topscore=0;
				if scores[rival] then
					topscore = scores[rival]:GetScore();
				end;
				assert(topscore);
				if topscore ~= 0  then
					self:settext(scores[rival]:GetName());
				else
					text = "- - - - - - -";
				end;
			else
				text = "- - - - - - -";
			end;
			self:settext(text);
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	LoadFont("Common normal")..{
		InitCommand=cmd(zoom,0.8;shadowlength,2;x,SCREEN_CENTER_X+245+140;y,SCREEN_CENTER_Y+80;horizalign,right;diffuse,color("#000000");strokecolor,color("White"));
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist)
				local scores = scorelist:GetHighScores();
				local topscore=0;
				if scores[rival] then
					topscore = scores[rival]:GetScore();
				end;
				assert(topscore);
				if topscore ~= 0  then
						local scorel3 = topscore%1000;
						local scorel2 = (topscore/1000)%1000;
						local scorel1 = (topscore/1000000)%1000000;
				text = string.format("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
				else
					text = "0,000,000";
				end;
			else
				text = "0,000,000";
			end;
			self:settext(text);
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.Quad{
	InitCommand=cmd(zoom,0.4;shadowlength,2;x,SCREEN_CENTER_X+245+22;y,SCREEN_CENTER_Y+80;horizalign,center;draworder,2);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[rival] then
						topscore = scores[rival]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					if scores[rival] then
						topgrade = scores[rival]:GetGrade();
						assert(topgrade);
						if scores[rival]:GetScore()>1  then
							if scores[rival]:GetScore()==1000000 and topgrade=="Grade_Tier07" then
								self:LoadBackground(THEME:GetPathG("myMusicWheel","Tier01"));
								self:diffusealpha(1);
							else
								self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(topgrade)));
								self:diffusealpha(1);
							end;	
						else
							self:diffusealpha(0);
						end;
					else
						self:diffusealpha(0);
					end;
			else
				self:diffusealpha(0);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
	InitCommand=cmd(zoom,1;shadowlength,2;x,SCREEN_CENTER_X+245+22+14;y,SCREEN_CENTER_Y+80-8;horizalign,center;draworder,1);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore;
					if scores[rival] then
						topscore = scores[rival];
						assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
						local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						if (misses+boos) == 0 and scores[rival]:GetScore() > 0 and (marvelous+perfects)>0 then
							if (greats+perfects) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
								self:glowblink();
								self:effectperiod(0.20);
								self:zoom(0.25);
							elseif greats == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
								self:glowshift();
								self:zoom(0.25);
							elseif (misses+boos+goods) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
								self:stopeffect();
								self:zoom(0.25);
							elseif (misses+boos) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
								self:stopeffect();
								self:zoom(0.25);
							end;
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					else
						self:diffusealpha(0);
					end;
			else
				self:diffusealpha(0);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	};
	return t;
end

t[#t+1] = LoadActor("ScoreFrame.png")..{
	InitCommand=cmd(player,PLAYER_1;vertalign,top;x,SCREEN_CENTER_X+245;y,SCREEN_CENTER_Y+80-30-20+5;zoom,0.7);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,1)..{
	InitCommand=cmd();
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,2)..{
	InitCommand=cmd(addy,38);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,3)..{
	InitCommand=cmd(addy,38+38);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,4)..{
	InitCommand=cmd(addy,38+38+38);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,5)..{
	InitCommand=cmd(addy,38+38+38+38);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};
t[#t+1] = RivalScore(PLAYER_2,6)..{
	InitCommand=cmd(addy,38+38+38+38+38);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,700);
	};

return t;