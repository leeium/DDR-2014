local t = Def.ActorFrame {};

--from DDR X2 AC by KenP because this screen is just to gorgeous to ruin
--placement values have been changed to support 1280,720 display

local function finAwardDisplay(pn, sAward, pos_Y)
	return Def.Sprite{
		InitCommand = function(self)
			if(sAward == 'StageAward_SingleDigitW3' or sAward == 'StageAward_OneW3' or sAward == 'StageAward_FullComboW3') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Fullcombo_ring"));
			elseif(sAward == 'StageAward_SingleDigitW2' or sAward == 'StageAward_OneW2' or sAward == 'StageAward_FullComboW2') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","PerfectFullcombo_ring"));
			elseif(sAward == 'StageAward_FullComboW1') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","MarvelousFullcombo_ring"));
			end;
			
			if(pn=="PL1") then
				self:player('PlayerNumber_P1');
				self:x(SCREEN_CENTER_X-150+15);
			else
				self:player('PlayerNumber_P2');
				self:x(SCREEN_CENTER_X+150+15);
			end
			
			self:y(pos_Y-15);
		end;
		OnCommand=cmd(zoom,0;diffusealpha,0;sleep,0.1;linear,0.2;zoom,0.38;diffusealpha,1;glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.15");effectperiod,0.2;spin;effectmagnitude,0,0,170);
		OffCommand=cmd(linear,0.2;zoom,0;diffusealpha,0);

	}

end





local function finGradeDisplay(pn, sGrade, pos_Y)
	return Def.Sprite{
		InitCommand = function(self)
			if(sGrade == 'Grade_Tier01') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_3A"));
			elseif(sGrade == 'Grade_Tier02') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_3A"));
			elseif(sGrade == 'Grade_Tier03') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_2A"));
			elseif(sGrade == 'Grade_Tier04') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_A"));
			elseif(sGrade == 'Grade_Tier05') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_B"));
			elseif(sGrade == 'Grade_Tier06') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_C"));
			elseif(sGrade == 'Grade_Tier07') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_D"));
			elseif(sGrade == 'Grade_Failed') then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","Grade_E"));
			end;
			
			if(pn=="PL1") then
				self:player('PlayerNumber_P1');
				self:x(SCREEN_CENTER_X-150);
			else
				self:player('PlayerNumber_P2');
				self:x(SCREEN_CENTER_X+150);
			end
			
			self:y(pos_Y);
		end;
		OnCommand=cmd(zoomy,0;zoomx,0.18;diffusealpha,0;sleep,0.1;linear,0.2;zoomy,0.18;diffusealpha,1;glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.15");effectperiod,0.2;);
		OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);

	}

end

local function StagePanelDisplay(pn, pos_Y)
	return Def.Sprite{
		InitCommand = function(self)
			self:Load(THEME:GetPathB("ScreenEvaluationSummary","stagepanel"));

			if(pn=="PL1") then
				self:player('PlayerNumber_P1');
				self:x(SCREEN_CENTER_X-218);
			else
				self:player('PlayerNumber_P2');
				self:x(SCREEN_CENTER_X+218);
				self:rotationy(180);
			end
			
			self:y(pos_Y);
		end;
		OnCommand=cmd(zoomy,0;zoomx,1;diffusealpha,0;sleep,0.1;linear,0.2;zoomy,1;diffusealpha,1);
		OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);

	}

end



--.back1 back2 back3 back4 back5


t[#t+1] = Def.Sprite{
	InitCommand = function(self)
		if STATSMAN:GetStagesPlayed() == 1 then
			self:Load(THEME:GetPathB("ScreenEvaluationSummary","back1"));
		elseif STATSMAN:GetStagesPlayed() == 2 then
			self:Load(THEME:GetPathB("ScreenEvaluationSummary","back2"));
		elseif STATSMAN:GetStagesPlayed() == 3 then
			self:Load(THEME:GetPathB("ScreenEvaluationSummary","back3"));
		elseif STATSMAN:GetStagesPlayed() == 4 then
			if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back3"));
			else 
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back4"));
			end; 
		elseif STATSMAN:GetStagesPlayed() == 5 then
			if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back3"));
			elseif GAMESTATE:IsExtraStage()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back4"));
			elseif GAMESTATE:IsExtraStage2()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back5"));
			end; 
		elseif STATSMAN:GetStagesPlayed() >= 6 then
			if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back3"));
			elseif GAMESTATE:IsExtraStage()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back4"));
			elseif GAMESTATE:IsExtraStage2()  then
				self:Load(THEME:GetPathB("ScreenEvaluationSummary","back5"));
			end; 
		end;
		
	end;
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomy,0;diffusealpha,0;sleep,0.1,linear,0.2;zoomy,1;diffusealpha,0.8);
	OffCommand=cmd(linear,0.25;diffusealpha,0;zoomy,0);
}







--P1 StagePanel
if STATSMAN:GetStagesPlayed()==1 then
	t[#t+1] = StagePanelDisplay("PL1",360);
	-- t[#t+1] = 	LoadFont("CourseEntryDisplay","number") .. {
		-- InitCommand=cmd(x,320;y,240;shadowlength,1;zoomx,0.95;zoomy,0.7;strokecolor,color("0.2,0.2,0.2,1"));
		-- OnCommand=function(self, params) 
			-- self:settext(g1);
		-- end;
	-- }
elseif STATSMAN:GetStagesPlayed() == 2 then
	t[#t+1] = StagePanelDisplay("PL1",360+30);
	t[#t+1] = StagePanelDisplay("PL1",360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	t[#t+1] = StagePanelDisplay("PL1",360+60);
	t[#t+1] = StagePanelDisplay("PL1",360+0);
	t[#t+1] = StagePanelDisplay("PL1",360-60);
	
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+60);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-60);
	else 
		t[#t+1] = StagePanelDisplay("PL1",360+90);
		t[#t+1] = StagePanelDisplay("PL1",360+30);
		t[#t+1] = StagePanelDisplay("PL1",360-30);
		t[#t+1] = StagePanelDisplay("PL1",360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+60);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-60);
	elseif GAMESTATE:IsExtraStage()  then
		t[#t+1] = StagePanelDisplay("PL1",360+90);
		t[#t+1] = StagePanelDisplay("PL1",360+30);
		t[#t+1] = StagePanelDisplay("PL1",360-30);
		t[#t+1] = StagePanelDisplay("PL1",360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+120);
		t[#t+1] = StagePanelDisplay("PL1",360+60);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-60);
		t[#t+1] = StagePanelDisplay("PL1",360-120);
	end; 
	
end

--P2 StagePanel
if STATSMAN:GetStagesPlayed()==1 then
	t[#t+1] = StagePanelDisplay("PL2",360);
	-- t[#t+1] = 	LoadFont("CourseEntryDisplay","number") .. {
		-- InitCommand=cmd(x,320;y,240;shadowlength,1;zoomx,0.95;zoomy,0.7;strokecolor,color("0.2,0.2,0.2,1"));
		-- OnCommand=function(self, params) 
			-- self:settext(g1);
		-- end;
	-- }
elseif STATSMAN:GetStagesPlayed() == 2 then
	t[#t+1] = StagePanelDisplay("PL2",360+30);
	t[#t+1] = StagePanelDisplay("PL2",360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	t[#t+1] = StagePanelDisplay("PL2",360+60);
	t[#t+1] = StagePanelDisplay("PL2",360+0);
	t[#t+1] = StagePanelDisplay("PL2",360-60);
	
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL2",360+60);
		t[#t+1] = StagePanelDisplay("PL2",360+0);
		t[#t+1] = StagePanelDisplay("PL2",360-60);
	else 
		t[#t+1] = StagePanelDisplay("PL2",360+90);
		t[#t+1] = StagePanelDisplay("PL2",360+30);
		t[#t+1] = StagePanelDisplay("PL2",360-30);
		t[#t+1] = StagePanelDisplay("PL2",360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL2",360+60);
		t[#t+1] = StagePanelDisplay("PL2",360+0);
		t[#t+1] = StagePanelDisplay("PL2",360-60);
	elseif GAMESTATE:IsExtraStage()  then
		t[#t+1] = StagePanelDisplay("PL2",360+90);
		t[#t+1] = StagePanelDisplay("PL2",360+30);
		t[#t+1] = StagePanelDisplay("PL2",360-30);
		t[#t+1] = StagePanelDisplay("PL2",360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL2",360+120);
		t[#t+1] = StagePanelDisplay("PL2",360+60);
		t[#t+1] = StagePanelDisplay("PL2",360+0);
		t[#t+1] = StagePanelDisplay("PL2",360-60);
		t[#t+1] = StagePanelDisplay("PL2",360-120);
	end; 
	
end



---ScoreDisplay
local function StageScoreDisplay(pn, sScore, pos_Y)
	return LoadFont("Common Normal") .. {
		InitCommand=cmd(y,pos_Y;shadowlength,1;zoomx,0.95;zoomy,0.7;strokecolor,color("0.2,0.2,0.2,1"));
		OnCommand=function(self, params) 
			if(pn=="PL1") then
				self:x(SCREEN_CENTER_X-250.1);
				self:player('PlayerNumber_P1');
			else
				self:x(SCREEN_CENTER_X+250.1);
				self:player('PlayerNumber_P2');
			end
				local scorel3 = sScore%1000;
				local scorel2 = (sScore/1000)%1000;
				local scorel1 = (sScore/1000000)%1000000;
				self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
		end;
		OffCommand=cmd(linear,0.1;diffusealpha,0);
	};
end




if STATSMAN:GetStagesPlayed()==1 then
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10);
elseif STATSMAN:GetStagesPlayed() == 2 then
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-30);
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+30);
elseif STATSMAN:GetStagesPlayed() == 3 then
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-60);
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+0);
	t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+60);
	else 
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-90);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-30);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+30);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+90);
	end
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+60);
	elseif GAMESTATE:IsExtraStage()  then
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-90);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-30);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+30);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+90);
	elseif GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-120);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+60);
		t[#t+1] = StageScoreDisplay("PL1",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetScore(),SCREEN_CENTER_Y+10+120);
	end;
end;

if STATSMAN:GetStagesPlayed()==1 then
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10);
elseif STATSMAN:GetStagesPlayed() == 2 then
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-30);
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+30);
elseif STATSMAN:GetStagesPlayed() == 3 then
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-60);
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+0);
	t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+60);
	else 
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-90);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-30);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+30);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+90);
	end
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+60);
	elseif GAMESTATE:IsExtraStage()  then
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-90);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-30);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+30);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+90);
	elseif GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-120);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10-60);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+0);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+60);
		t[#t+1] = StageScoreDisplay("PL2",STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetScore(),SCREEN_CENTER_Y+10+120);
	end;
end;


---DiffDisplay
local function StageDiffDisplay(pn, sdiff, pos_Y)
	return LoadActor("SummaryDiff.png").. {
		InitCommand=cmd(y,pos_Y-2;shadowlength,0;zoomto,10,55;diffusealpha,0);
		OnCommand=function(self, params) 
			if(pn=="PL1") then
				self:x(SCREEN_CENTER_X-117.1);
				self:player('PlayerNumber_P1');
				self:diffuse(CustomDifficultyToColor(sdiff));
				(cmd(diffusealpha,0;sleep,0.1,linear,0.2;diffusealpha,1))(self);
			else
				self:x(SCREEN_CENTER_X+117.1);
				self:rotationy(180);
				self:player('PlayerNumber_P2');
				self:diffuse(CustomDifficultyToColor(sdiff));
				(cmd(diffusealpha,0;sleep,0.1,linear,0.2;diffusealpha,1))(self);
			end
		end;
		OffCommand=cmd(linear,0.2;diffusealpha,0;zoomy,0;);
	};
end

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then

	if STATSMAN:GetStagesPlayed()==1 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y);
	elseif STATSMAN:GetStagesPlayed() == 2 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
		t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
	elseif STATSMAN:GetStagesPlayed() == 3 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
		t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
		t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
	elseif STATSMAN:GetStagesPlayed() == 4 then
		if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
		else 
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL1",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-90);
			t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
			t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
			t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+90);
		end
	elseif STATSMAN:GetStagesPlayed() >= 5 then
		if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
		elseif GAMESTATE:IsExtraStage()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL1",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-90);
			t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
			t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
			t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+90);
		elseif GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			local diff5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P1'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL1",diff5[1]:GetDifficulty(),SCREEN_CENTER_Y-120);
			t[#t+1] = StageDiffDisplay("PL1",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL1",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL1",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
			t[#t+1] = StageDiffDisplay("PL1",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+120);
		end;
	end;
end;

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then

	if STATSMAN:GetStagesPlayed()==1 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y);
	elseif STATSMAN:GetStagesPlayed() == 2 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
		t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
	elseif STATSMAN:GetStagesPlayed() == 3 then
		local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
		t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
		t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
		t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
	elseif STATSMAN:GetStagesPlayed() == 4 then
		if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
		else 
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL2",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-90);
			t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
			t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
			t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+90);
		end
	elseif STATSMAN:GetStagesPlayed() >= 5 then
		if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
		elseif GAMESTATE:IsExtraStage()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL2",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-90);
			t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y-30);
			t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+30);
			t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+90);
		elseif GAMESTATE:IsExtraStage2()  then
			local diff1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			local diff5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P2'):GetPlayedSteps();
			t[#t+1] = StageDiffDisplay("PL2",diff5[1]:GetDifficulty(),SCREEN_CENTER_Y-120);
			t[#t+1] = StageDiffDisplay("PL2",diff4[1]:GetDifficulty(),SCREEN_CENTER_Y-60);
			t[#t+1] = StageDiffDisplay("PL2",diff3[1]:GetDifficulty(),SCREEN_CENTER_Y+0);
			t[#t+1] = StageDiffDisplay("PL2",diff2[1]:GetDifficulty(),SCREEN_CENTER_Y+60);
			t[#t+1] = StageDiffDisplay("PL2",diff1[1]:GetDifficulty(),SCREEN_CENTER_Y+120);
		end;
	end;
end;






---P1 Award
if STATSMAN:GetStagesPlayed()==1 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL1", aw1, 360);
elseif STATSMAN:GetStagesPlayed() == 2 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL1", aw1, 360+30);
	t[#t+1] = finAwardDisplay("PL1", aw2, 360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL1", aw1, 360+60);
	t[#t+1] = finAwardDisplay("PL1", aw2, 360+0);
	t[#t+1] = finAwardDisplay("PL1", aw3, 360-60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL1", aw1, 360+60);
		t[#t+1] = finAwardDisplay("PL1", aw2, 360+0);
		t[#t+1] = finAwardDisplay("PL1", aw3, 360-60);
	else 
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL1", aw1, 360+90);
		t[#t+1] = finAwardDisplay("PL1", aw2, 360+30);
		t[#t+1] = finAwardDisplay("PL1", aw3, 360-30);
		t[#t+1] = finAwardDisplay("PL1", aw4, 360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL1", aw1, 360+60);
		t[#t+1] = finAwardDisplay("PL1", aw2, 360+0);
		t[#t+1] = finAwardDisplay("PL1", aw3, 360-60);
	elseif GAMESTATE:IsExtraStage()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL1", aw1, 360+90);
		t[#t+1] = finAwardDisplay("PL1", aw2, 360+30);
		t[#t+1] = finAwardDisplay("PL1", aw3, 360-30);
		t[#t+1] = finAwardDisplay("PL1", aw4, 360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		local aw5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P1'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL1", aw1, 360+120);
		t[#t+1] = finAwardDisplay("PL1", aw2, 360+60);
		t[#t+1] = finAwardDisplay("PL1", aw3, 360+0);
		t[#t+1] = finAwardDisplay("PL1", aw4, 360-60);
		t[#t+1] = finAwardDisplay("PL1", aw5, 360-120);
	end; 
	
end

---P2 Award
if STATSMAN:GetStagesPlayed()==1 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL2", aw1, 360);
elseif STATSMAN:GetStagesPlayed() == 2 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL2", aw1, 360+30);
	t[#t+1] = finAwardDisplay("PL2", aw2, 360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
	t[#t+1] = finAwardDisplay("PL2", aw1, 360+60);
	t[#t+1] = finAwardDisplay("PL2", aw2, 360+0);
	t[#t+1] = finAwardDisplay("PL2", aw3, 360-60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL2", aw1, 360+60);
		t[#t+1] = finAwardDisplay("PL2", aw2, 360+0);
		t[#t+1] = finAwardDisplay("PL2", aw3, 360-60);
	else 
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL2", aw1, 360+90);
		t[#t+1] = finAwardDisplay("PL2", aw2, 360+30);
		t[#t+1] = finAwardDisplay("PL2", aw3, 360-30);
		t[#t+1] = finAwardDisplay("PL2", aw4, 360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL2", aw1, 360+60);
		t[#t+1] = finAwardDisplay("PL2", aw2, 360+0);
		t[#t+1] = finAwardDisplay("PL2", aw3, 360-60);
	elseif GAMESTATE:IsExtraStage()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL2", aw1, 360+90);
		t[#t+1] = finAwardDisplay("PL2", aw2, 360+30);
		t[#t+1] = finAwardDisplay("PL2", aw3, 360-30);
		t[#t+1] = finAwardDisplay("PL2", aw4, 360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		local aw1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		local aw5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P2'):GetStageAward();
		t[#t+1] = finAwardDisplay("PL2", aw1, 360+120);
		t[#t+1] = finAwardDisplay("PL2", aw2, 360+60);
		t[#t+1] = finAwardDisplay("PL2", aw3, 360+0);
		t[#t+1] = finAwardDisplay("PL2", aw4, 360-60);
		t[#t+1] = finAwardDisplay("PL2", aw5, 360-120);
	end; 
	
end








---P1 Grade
if STATSMAN:GetStagesPlayed()==1 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	t[#t+1] = finGradeDisplay("PL1", g1, 360);
	-- t[#t+1] = 	LoadFont("CourseEntryDisplay","number") .. {
		-- InitCommand=cmd(x,320;y,240;shadowlength,1;zoomx,0.95;zoomy,0.7;strokecolor,color("0.2,0.2,0.2,1"));
		-- OnCommand=function(self, params) 
			-- self:settext(g1);
		-- end;
	-- }
elseif STATSMAN:GetStagesPlayed() == 2 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	t[#t+1] = finGradeDisplay("PL1", g1, 360+30);
	t[#t+1] = finGradeDisplay("PL1", g2, 360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
	t[#t+1] = finGradeDisplay("PL1", g1, 360+60);
	t[#t+1] = finGradeDisplay("PL1", g2, 360+0);
	t[#t+1] = finGradeDisplay("PL1", g3, 360-60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		t[#t+1] = finGradeDisplay("PL1", g1, 360+60);
		t[#t+1] = finGradeDisplay("PL1", g2, 360+0);
		t[#t+1] = finGradeDisplay("PL1", g3, 360-60);
	else 
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		t[#t+1] = finGradeDisplay("PL1", g1, 360+90);
		t[#t+1] = finGradeDisplay("PL1", g2, 360+30);
		t[#t+1] = finGradeDisplay("PL1", g3, 360-30);
		t[#t+1] = finGradeDisplay("PL1", g4, 360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		t[#t+1] = finGradeDisplay("PL1", g1, 360+60);
		t[#t+1] = finGradeDisplay("PL1", g2, 360+0);
		t[#t+1] = finGradeDisplay("PL1", g3, 360-60);
	elseif GAMESTATE:IsExtraStage()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		t[#t+1] = finGradeDisplay("PL1", g1, 360+90);
		t[#t+1] = finGradeDisplay("PL1", g2, 360+30);
		t[#t+1] = finGradeDisplay("PL1", g3, 360-30);
		t[#t+1] = finGradeDisplay("PL1", g4, 360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		local g5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P1'):GetGrade();
		t[#t+1] = finGradeDisplay("PL1", g1, 360+120);
		t[#t+1] = finGradeDisplay("PL1", g2, 360+60);
		t[#t+1] = finGradeDisplay("PL1", g3, 360+0);
		t[#t+1] = finGradeDisplay("PL1", g4, 360-60);
		t[#t+1] = finGradeDisplay("PL1", g5, 360-120);
	end; 
	
end

---P2 Grade
if STATSMAN:GetStagesPlayed()==1 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	t[#t+1] = finGradeDisplay("PL2", g1, 360);
	-- t[#t+1] = 	LoadFont("CourseEntryDisplay","number") .. {
		-- InitCommand=cmd(x,320;y,240;shadowlength,1;zoomx,0.95;zoomy,0.7;strokecolor,color("0.2,0.2,0.2,1"));
		-- OnCommand=function(self, params) 
			-- self:settext(g1);
		-- end;
	-- }
elseif STATSMAN:GetStagesPlayed() == 2 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	t[#t+1] = finGradeDisplay("PL2", g1, 360+30);
	t[#t+1] = finGradeDisplay("PL2", g2, 360-30);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
	t[#t+1] = finGradeDisplay("PL2", g1, 360+60);
	t[#t+1] = finGradeDisplay("PL2", g2, 360+0);
	t[#t+1] = finGradeDisplay("PL2", g3, 360-60);
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		t[#t+1] = finGradeDisplay("PL2", g1, 360+60);
		t[#t+1] = finGradeDisplay("PL2", g2, 360+0);
		t[#t+1] = finGradeDisplay("PL2", g3, 360-60);
	else 
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		t[#t+1] = finGradeDisplay("PL2", g1, 360+90);
		t[#t+1] = finGradeDisplay("PL2", g2, 360+30);
		t[#t+1] = finGradeDisplay("PL2", g3, 360-30);
		t[#t+1] = finGradeDisplay("PL2", g4, 360-90);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		t[#t+1] = finGradeDisplay("PL2", g1, 360+60);
		t[#t+1] = finGradeDisplay("PL2", g2, 360+0);
		t[#t+1] = finGradeDisplay("PL2", g3, 360-60);
	elseif GAMESTATE:IsExtraStage()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		t[#t+1] = finGradeDisplay("PL2", g1, 360+90);
		t[#t+1] = finGradeDisplay("PL2", g2, 360+30);
		t[#t+1] = finGradeDisplay("PL2", g3, 360-30);
		t[#t+1] = finGradeDisplay("PL2", g4, 360-90);
	elseif GAMESTATE:IsExtraStage2()  then
		local g1 = STATSMAN:GetPlayedStageStats(1):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g2 = STATSMAN:GetPlayedStageStats(2):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g3 = STATSMAN:GetPlayedStageStats(3):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g4 = STATSMAN:GetPlayedStageStats(4):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		local g5 = STATSMAN:GetPlayedStageStats(5):GetPlayerStageStats('PlayerNumber_P2'):GetGrade();
		t[#t+1] = finGradeDisplay("PL2", g1, 360+120);
		t[#t+1] = finGradeDisplay("PL2", g2, 360+60);
		t[#t+1] = finGradeDisplay("PL2", g3, 360+0);
		t[#t+1] = finGradeDisplay("PL2", g4, 360-60);
		t[#t+1] = finGradeDisplay("PL2", g5, 360-120);
	end; 
	
end


--¥ástage¦r¼Ë
function stageDisplay(pn, sStage, pos_Y)
	return Def.Sprite{
		InitCommand = function(self)
			if(sStage == '1st') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","1st"));
			elseif(sStage == '2nd') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","2nd"));
			elseif(sStage == '3rd') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","3rd"));
			elseif(sStage == '4th') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","4th"));
			elseif(sStage == '5th') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","5th"));
			elseif(sStage == '6th') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","6th"));
			elseif(sStage == 'Final') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","Final"));
			elseif(sStage == 'Extra1') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","Extra1"));
			elseif(sStage == 'Extra2') then
				self:Load(THEME:GetPathB("SummaryStageDisplay","Extra2"));
			end;
			
			if(pn=="PL1") then
				self:player('PlayerNumber_P1');
				self:x(SCREEN_CENTER_X-250);
			else
				self:player('PlayerNumber_P2');
				self:x(SCREEN_CENTER_X+250);
			end
			
			self:y(pos_Y-10);
			self:zoomy(0);
			self:diffusealpha(0);
		end;
		OnCommand=cmd(sleep,0.1;linear,0.2;zoomy,1;diffusealpha,1);
		OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);

	}
end

if STATSMAN:GetStagesPlayed()==1 then
	t[#t+1] = stageDisplay("PL1", 'Final', 360);
	t[#t+1] = stageDisplay("PL2", 'Final', 360);
elseif STATSMAN:GetStagesPlayed() == 2 then
	if(GAMESTATE:IsExtraStage()) then
		t[#t+1] = stageDisplay("PL1", 'Final',  360-30);
		t[#t+1] = stageDisplay("PL1", 'Extra1', 360+30);
		t[#t+1] = stageDisplay("PL2", 'Final',  360-30);
		t[#t+1] = stageDisplay("PL2", 'Extra1', 360+30);
	else
		t[#t+1] = stageDisplay("PL1", '1st',   360-30);
		t[#t+1] = stageDisplay("PL1", 'Final', 360+30);
		t[#t+1] = stageDisplay("PL2", '1st',   360-30);
		t[#t+1] = stageDisplay("PL2", 'Final', 360+30);
	end;
elseif STATSMAN:GetStagesPlayed() == 3 then
	if(GAMESTATE:IsExtraStage2()) then
		t[#t+1] = stageDisplay("PL1", 'Final',  360-60);
		t[#t+1] = stageDisplay("PL1", 'Extra1', 360+0);
		t[#t+1] = stageDisplay("PL1", 'Extra2', 360+60);
		t[#t+1] = stageDisplay("PL2", 'Final',  360-60);
		t[#t+1] = stageDisplay("PL2", 'Extra1', 360+0);
		t[#t+1] = stageDisplay("PL2", 'Extra2', 360+60);
	elseif (GAMESTATE:IsExtraStage()) then
		t[#t+1] = stageDisplay("PL1", '1st',    360-60);
		t[#t+1] = stageDisplay("PL1", 'Final',  360+0);
		t[#t+1] = stageDisplay("PL1", 'Extra1', 360+60);
		t[#t+1] = stageDisplay("PL2", '1st',  360-60);
		t[#t+1] = stageDisplay("PL2", 'Final', 360+0);
		t[#t+1] = stageDisplay("PL2", 'Extra1', 360+60);
	else
		t[#t+1] = stageDisplay("PL1", '1st',   360-60);
		t[#t+1] = stageDisplay("PL1", '2nd',   360+0);
		t[#t+1] = stageDisplay("PL1", 'Final', 360+60);
		t[#t+1] = stageDisplay("PL2", '1st',   360-60);
		t[#t+1] = stageDisplay("PL2", '2nd',   360+0);
		t[#t+1] = stageDisplay("PL2", 'Final', 360+60);
	end;
elseif STATSMAN:GetStagesPlayed() == 4 then
	if(GAMESTATE:IsExtraStage2()) then
		t[#t+1] = stageDisplay("PL1", '1st',     360-90);
		t[#t+1] = stageDisplay("PL1", 'Final',   360-30);
		t[#t+1] = stageDisplay("PL1", 'Extra1',  360+30);
		t[#t+1] = stageDisplay("PL1", 'Extra2',  360+90);
		t[#t+1] = stageDisplay("PL2", '1st',     360-90);
		t[#t+1] = stageDisplay("PL2", 'Final',   360-30);
		t[#t+1] = stageDisplay("PL2", 'Extra1',  360+30);
		t[#t+1] = stageDisplay("PL2", 'Extra2',  360+90);
	elseif (GAMESTATE:IsExtraStage()) then
		t[#t+1] = stageDisplay("PL1", '1st',     360-90);
		t[#t+1] = stageDisplay("PL1", '2nd',     360-30);
		t[#t+1] = stageDisplay("PL1", 'Final',   360+30);
		t[#t+1] = stageDisplay("PL1", 'Extra1',  360+90);
		t[#t+1] = stageDisplay("PL2", '1st',     360-90);
		t[#t+1] = stageDisplay("PL2", '2nd',     360-30);
		t[#t+1] = stageDisplay("PL2", 'Final',   360+30);
		t[#t+1] = stageDisplay("PL2", 'Extra1',  360+90);
	else
		t[#t+1] = stageDisplay("PL1", '2nd',   360-60);
		t[#t+1] = stageDisplay("PL1", '3rd',   360+0);
		t[#t+1] = stageDisplay("PL1", 'Final', 360+60);
		t[#t+1] = stageDisplay("PL2", '2nd',   360-60);
		t[#t+1] = stageDisplay("PL2", '3rd',   360+0);
		t[#t+1] = stageDisplay("PL2", 'Final', 360+60);
	end
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if(GAMESTATE:IsExtraStage2()) then
		t[#t+1] = stageDisplay("PL1", '1st',     360-120);
		t[#t+1] = stageDisplay("PL1", '2nd',     360-60);
		t[#t+1] = stageDisplay("PL1", 'Final',   360+0);
		t[#t+1] = stageDisplay("PL1", 'Extra1',  360+60);
		t[#t+1] = stageDisplay("PL1", 'Extra2',  360+120);
		t[#t+1] = stageDisplay("PL2", '1st',     360-120);
		t[#t+1] = stageDisplay("PL2", '2nd',     360-60);
		t[#t+1] = stageDisplay("PL2", 'Final',   360+0);
		t[#t+1] = stageDisplay("PL2", 'Extra1',  360+60);
		t[#t+1] = stageDisplay("PL2", 'Extra2',  360+120);
	elseif (GAMESTATE:IsExtraStage()) then
		t[#t+1] = stageDisplay("PL1", '2nd',     360-90);
		t[#t+1] = stageDisplay("PL1", '3rd',     360-30);
		t[#t+1] = stageDisplay("PL1", 'Final',   360+30);
		t[#t+1] = stageDisplay("PL1", 'Extra1',  360+90);
		t[#t+1] = stageDisplay("PL2", '2nd',     360-90);
		t[#t+1] = stageDisplay("PL2", '3rd',     360-30);
		t[#t+1] = stageDisplay("PL2", 'Final',   360+30);
		t[#t+1] = stageDisplay("PL2", 'Extra1',  360+90);
	else
		t[#t+1] = stageDisplay("PL1", '3rd',   360-60);
		t[#t+1] = stageDisplay("PL1", '4th',   360+0);
		t[#t+1] = stageDisplay("PL1", 'Final', 360+60);
		t[#t+1] = stageDisplay("PL2", '3rd',   360-60);
		t[#t+1] = stageDisplay("PL2", '4th',   360+0);
		t[#t+1] = stageDisplay("PL2", 'Final', 360+60);
	end
end









---song Info function---
function SongDisplay(song, pos_Y)
	return Def.ActorFrame {
		
		
		Def.Quad {
			InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;y,pos_Y-30;zoomto,SCREEN_WIDTH+30,1;fadeleft,0.25;faderight,0.25;);
			OnCommand=cmd(sleep,0.1;linear,0.2;diffuse,Color("Black");diffusealpha,0.13);
			OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);
		};
		
		Def.Quad {
			InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;y,pos_Y+30;zoomto,SCREEN_WIDTH+30,1;fadeleft,0.25;faderight,0.25;);
			OnCommand=cmd(sleep,0.1;linear,0.2;diffuse,Color("Black");diffusealpha,0.13);
			OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);
		};
		
		Def.Sprite{
			InitCommand = function(self)
				self:Load(song:GetJacketPath());
				self:x(SCREEN_CENTER_X-80);
				
				self:y(pos_Y);
				self:zoom(0);
				self:diffusealpha(0);
			end;
			OnCommand=cmd(sleep,0.1;linear,0.2;scaletoclipped,50,50;diffusealpha,1);
			OffCommand=cmd(linear,0.2;zoom,0;diffusealpha,0);
		};
		
		LoadFont("Common Normal") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X+25;y,pos_Y-5;shadowlength,0;maxwidth,350);
			OnCommand=function(self)
				self:zoomx(0.43);
				self:zoomy(0);
				self:diffuse(color("0,0,0,1"));
				self:strokecolor(color("0.9,0.9,0.9,1"));
				self:settext(song:GetDisplayFullTitle());
				(cmd(linear,0.2;zoomy,0.43))(self);
			end;
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
		
		LoadFont("Common Normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+25;y,pos_Y+5;shadowlength,0;maxwidth,350);
			OnCommand=function(self)
				self:zoomx(0.37);
				self:zoomy(0);
				self:diffuse(color("0,0,0,1"));
				self:strokecolor(color("0.9,0.9,0.9,1"));
				self:settext(song:GetDisplayArtist());
				(cmd(linear,0.2;zoomy,0.37))(self);
			end;
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
	};
end

---Load song Info---
if STATSMAN:GetStagesPlayed()==1 then
	local songs = STATSMAN:GetPlayedStageStats(1):GetPlayedSongs();
	
	t[#t+1] = SongDisplay(songs[1],360);
elseif STATSMAN:GetStagesPlayed()==2 then
	local songs1 = STATSMAN:GetPlayedStageStats(1):GetPlayedSongs();
	local songs2 = STATSMAN:GetPlayedStageStats(2):GetPlayedSongs();
	t[#t+1] = SongDisplay(songs2[1],360-30);
	t[#t+1] = SongDisplay(songs1[1],360+30);
elseif STATSMAN:GetStagesPlayed()==3 then
	local songs1 = STATSMAN:GetPlayedStageStats(1):GetPlayedSongs();
	local songs2 = STATSMAN:GetPlayedStageStats(2):GetPlayedSongs();
	local songs3 = STATSMAN:GetPlayedStageStats(3):GetPlayedSongs();
	t[#t+1] = SongDisplay(songs3[1],360-60);
	t[#t+1] = SongDisplay(songs2[1],360+0);
	t[#t+1] = SongDisplay(songs1[1],360+60);
elseif STATSMAN:GetStagesPlayed()==4 then
	local songs1 = STATSMAN:GetPlayedStageStats(1):GetPlayedSongs();
	local songs2 = STATSMAN:GetPlayedStageStats(2):GetPlayedSongs();
	local songs3 = STATSMAN:GetPlayedStageStats(3):GetPlayedSongs();
	local songs4 = STATSMAN:GetPlayedStageStats(4):GetPlayedSongs();
	if(GAMESTATE:IsExtraStage2()) then
		t[#t+1] = SongDisplay(songs4[1],360-90);
		t[#t+1] = SongDisplay(songs3[1],360-30);
		t[#t+1] = SongDisplay(songs2[1],360+30);
		t[#t+1] = SongDisplay(songs1[1],360+90);
	elseif (GAMESTATE:IsExtraStage()) then
		t[#t+1] = SongDisplay(songs4[1],360-90);
		t[#t+1] = SongDisplay(songs3[1],360-30);
		t[#t+1] = SongDisplay(songs2[1],360+30);
		t[#t+1] = SongDisplay(songs1[1],360+90);
	else 
		t[#t+1] = SongDisplay(songs3[1],360-60);
		t[#t+1] = SongDisplay(songs2[1],360+0);
		t[#t+1] = SongDisplay(songs1[1],360+60);
	end
elseif STATSMAN:GetStagesPlayed()>=5 then
	local songs1 = STATSMAN:GetPlayedStageStats(1):GetPlayedSongs();
	local songs2 = STATSMAN:GetPlayedStageStats(2):GetPlayedSongs();
	local songs3 = STATSMAN:GetPlayedStageStats(3):GetPlayedSongs();
	local songs4 = STATSMAN:GetPlayedStageStats(4):GetPlayedSongs();
	local songs5 = STATSMAN:GetPlayedStageStats(5):GetPlayedSongs();
	if(GAMESTATE:IsExtraStage2()) then
		t[#t+1] = SongDisplay(songs5[1],360-120);
		t[#t+1] = SongDisplay(songs4[1],360-60);
		t[#t+1] = SongDisplay(songs3[1],360+0);
		t[#t+1] = SongDisplay(songs2[1],360+60);
		t[#t+1] = SongDisplay(songs1[1],360+120);
	elseif (GAMESTATE:IsExtraStage()) then
		t[#t+1] = SongDisplay(songs4[1],360-90);
		t[#t+1] = SongDisplay(songs3[1],360-30);
		t[#t+1] = SongDisplay(songs2[1],360+30);
		t[#t+1] = SongDisplay(songs1[1],360+90);
	else 
		t[#t+1] = SongDisplay(songs3[1],360-60);
		t[#t+1] = SongDisplay(songs2[1],360+0);
		t[#t+1] = SongDisplay(songs1[1],360+60);
	end
end



-----PlayerDisplay
t[#t+1] = LoadActor("LabelP1")..{
		InitCommand=cmd(x,SCREEN_LEFT+80;y,SCREEN_CENTER_Y-268;player,PLAYER_1;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,-300);
	};
t[#t+1] = LoadActor("LabelP2")..{
		InitCommand=cmd(x,SCREEN_RIGHT-80;y,SCREEN_CENTER_Y-268;player,PLAYER_2;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,300);
	};




return t ;




