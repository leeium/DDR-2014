local function GetDifListY(d)
	local r=0;
	if d == "Difficulty_Beginner" then
		r=(42*0);
	elseif d == "Difficulty_Easy" then
		r=(42*1);
	elseif d == "Difficulty_Medium" then
		r=(42*2);
	elseif d == "Difficulty_Hard" then
		r=(42*3);
	elseif d == "Difficulty_Challenge" then
		r=(42*4);
	elseif d == "Difficulty_Edit" then
		r=(42*5);
	end;
	return r;
end;

local function DiffNumber(diff)
	local sd = 0;
	if diff == "Difficulty_Beginner" then
		sd = 1;
	elseif diff == "Difficulty_Easy" then
		sd = 2;
	elseif diff == "Difficulty_Medium" then
		sd = 3;
	elseif diff == "Difficulty_Hard" then
		sd = 4;
	elseif diff == "Difficulty_Challenge" then
		sd = 5;
	end;
	return sd;
end;

local function GetFlexDifListY(d, st, song)
	local r=0;
	local b=0;
	if d == "Difficulty_Beginner" then
		r=(42*0);
	elseif d == "Difficulty_Easy" then
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Beginner") then
			b=b+1;
		end;
		r=(42*b);
	elseif d == "Difficulty_Medium" then
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Beginner") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
			b=b+1;
		end;
		r=(42*b);
	elseif d == "Difficulty_Hard" then
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Beginner") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Medium") then
			b=b+1;
		end;
		r=(42*b);
	elseif d == "Difficulty_Challenge" then
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Beginner") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Medium") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Hard") then
			b=b+1;
		end;
		r=(42*b);
	elseif d == "Difficulty_Edit" then
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Beginner") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Medium") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Hard") then
			b=b+1;
		end;
		if song:HasStepsTypeAndDifficulty(st,"Difficulty_Challenge") then
			b=b+1;
		end;
		r=(42*b);
	end;
	return r;
end;


local function GetDifListX(self,pn,offset,fade)
local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if pn==PLAYER_1 then
		self:x(SCREEN_LEFT+150+offset);
		if fade>0 then
			self:faderight(fade);
		end;
	elseif pn==PLAYER_2 then
		self:x(SCREEN_RIGHT-200+offset);
		if fade>0 then
			self:fadeleft(fade);
		end;
	end;
	return r;
end;

local function GetDifListGradeX(self,pn,offset,fade)
	if pn==PLAYER_1 then
		self:x(SCREEN_CENTER_X-395+offset);
		if fade>0 then
			self:faderight(fade);
		end;
	else
		self:x(SCREEN_CENTER_X+101+offset);
		if fade>0 then
			self:fadeleft(fade);
		end;
	end;
	return r;
end;


local function DrawDifList(pn,diff)
	local t=Def.ActorFrame {
		InitCommand=cmd(player,pn;y,SCREEN_CENTER_Y-150-43.5-30+20;draworder,55);
--disabled
		Def.Quad{
			InitCommand=cmd(diffuse,color("#000000");setsize,490,50;zoom,0.7);
			SetCommand=function(self)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song=GAMESTATE:GetCurrentSong();
			local course = GAMESTATE:GetCurrentCourse();
			if song then
				GetDifListX(self,pn,15,0);
				self:y(GetDifListY(diff, st, song)+1.5);
				if song:HasStepsTypeAndDifficulty(st,diff) then
					self:diffusealpha(0);
				else
					self:diffusealpha(0.3);
				end;
			end;
			end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
--meter
		LoadFont("Common Normal")..{
			InitCommand=cmd(draworder,99;diffuse,color("#000000");strokecolor,Color("White");zoom,0.9);
			SetCommand=function(self)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song=GAMESTATE:GetCurrentSong();
			local course = GAMESTATE:GetCurrentCourse();
			if song then
				GetDifListX(self,pn,-140,0);
				self:y(GetDifListY(diff, st, song));
				if song:HasStepsTypeAndDifficulty(st,diff) then
				local steps = song:GetOneSteps( st, diff );
					self:settext(steps:GetMeter());
				else
					self:settext("");
				end;
			else
				self:settext("");
			end;
			end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
--score number
		LoadFont("Common Normal")..{
			InitCommand=cmd(zoom,0.8;draworder,2);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				local song=GAMESTATE:GetCurrentSong();
				local course = GAMESTATE:GetCurrentCourse();
			if song then
				GetDifListX(self,pn,130,0);
				self:y(GetDifListY(diff, st, song));
				if song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps( st, diff );
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					self:diffuse(color("1,1,1,1"));
					self:strokecolor(color("0.2,0.2,0.2,1"));
					self:diffusealpha(1);
					self:shadowlength(2);
					if pn==PLAYER_1 and topscore ~= 0  then
						local scorel3 = topscore%1000;
						local scorel2 = (topscore/1000)%1000;
						local scorel1 = (topscore/1000000)%1000000;
						self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
					elseif pn==PLAYER_2 and topscore ~= 0  then
						local scorel3 = topscore%1000;
						local scorel2 = (topscore/1000)%1000;
						local scorel1 = (topscore/1000000)%1000000;
						self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
					else 
						self:settextf("");
					end;

				else
					self:settext("");
				end;
			else
				self:settext("");
			end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
--grade
		Def.Quad{
			InitCommand=cmd(zoom,0.3);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				local song=GAMESTATE:GetCurrentSong();
				local course = GAMESTATE:GetCurrentCourse();
			if song then
				GetDifListX(self,pn,128,0);
				self:y(GetDifListY(diff, st, song));
				if song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps( st, diff );
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					if scores[1] then
						topgrade = scores[1]:GetGrade();
						assert(topgrade);
						if scores[1]:GetScore()>1  then
							if scores[1]:GetScore()==1000000 and topgrade=="Grade_Tier07" then
								self:LoadBackground(THEME:GetPathG("myMusicWheel","Tier01"));
								self:diffusealpha(1);
								self:addx(-60);
							else
								self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(topgrade)));
								self:diffusealpha(1);
								self:addx(-60);
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
			else
				self:diffusealpha(0);
			end;
		end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
--FC Ring
		LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
			InitCommand=cmd(shadowlength,1;zoom,0;draworder,1);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				local song=GAMESTATE:GetCurrentSong();
				local course = GAMESTATE:GetCurrentCourse();
			if song then
				GetDifListX(self,pn,110,0);
				self:y(GetDifListY(diff, st, song)-19);
				if song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps( st, diff );
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore;
					if scores[1] then
						topscore = scores[1];
						assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
						local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						self:addx(-31);
						self:addy(13.5);
						if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
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
							self:diffusealpha(0.8);
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
		end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
	};
	return t;
end;

local t = Def.ActorFrame {};

if  not GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor("DiffFrame.png")..{
	InitCommand=cmd(player,PLAYER_2;vertalign,top;x,SCREEN_RIGHT-175-10;y,SCREEN_CENTER_Y-160-43-6.5-30+20;zoom,0.7);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Beginner')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Easy')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Medium')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Hard')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Challenge')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Edit')..{
		OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
	
	t[#t+1]=Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-219.5+20-3);
		OffCommand=cmd(zoom,0);
		-- 2P Cursor
		Def.Quad{
			InitCommand = cmd(hibernate,0.7;y,100;x,431+44;visible,false;setsize,438,50;zoom,0.7);
			CurrentStepsP2ChangedMessageCommand=function(self)
				self:finishtweening();
				self:visible(true);
				local song=GAMESTATE:GetCurrentSong();
				if song then
				local diff = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				self:y(GetDifListY(diff, st, song));
				local getsavediff = getenv("SaveDifficulty2P");
				if getsavediff ~= nil then
					local zd = (getsavediff);
					self:diffuse(CustomDifficultyToColor(diff)); 
					if song:HasStepsTypeAndDifficulty(st,"Difficulty_Edit") then
						self:addy(23*zd);
						self:linear(0.05);
						self:addy(-23*zd);
					else
						self:addy(26.5*zd);
						self:linear(0.05);
						self:addy(-26.5*zd);
					end;
				end;
				self:queuecommand("Save");
				end;
			end;
			SaveCommand=function(self)
				setenv("SaveDifficulty2P",DiffNumber(diff));
			end;
	};	
	};
t[#t+1] = LoadActor("DiffTitles.png")..{
	InitCommand=cmd(player,PLAYER_2;vertalign,top;x,SCREEN_RIGHT-175-27;y,SCREEN_CENTER_Y-160-43-6.5-30+20;zoom,0.7);
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
	};
end;

return t;
