local t = Def.ActorFrame {};

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

-----PlayerDisplay
t[#t+1] = LoadActor("LabelP1")..{
		InitCommand=cmd(x,SCREEN_LEFT+80;y,SCREEN_CENTER_Y-268;player,PLAYER_1;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,-300);
	};
t[#t+1] = LoadActor("LabelP2")..{
		InitCommand=cmd(x,SCREEN_RIGHT-80;y,SCREEN_CENTER_Y-268;player,PLAYER_2;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,300);
	};

-- underlay
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
	t[#t+1] = StagePanelDisplay("PL1",360+40);
	t[#t+1] = StagePanelDisplay("PL1",360-40);
	
elseif STATSMAN:GetStagesPlayed() == 3 then
	t[#t+1] = StagePanelDisplay("PL1",360+80);
	t[#t+1] = StagePanelDisplay("PL1",360+0);
	t[#t+1] = StagePanelDisplay("PL1",360-80);
	
elseif STATSMAN:GetStagesPlayed() == 4 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+80);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-80);
	else 
		t[#t+1] = StagePanelDisplay("PL1",360+120);
		t[#t+1] = StagePanelDisplay("PL1",360+40);
		t[#t+1] = StagePanelDisplay("PL1",360-40);
		t[#t+1] = StagePanelDisplay("PL1",360-120);
	end; 
elseif STATSMAN:GetStagesPlayed() >= 5 then
	if not GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+80);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-80);
	elseif GAMESTATE:IsExtraStage()  then
		t[#t+1] = StagePanelDisplay("PL1",360+120);
		t[#t+1] = StagePanelDisplay("PL1",360+40);
		t[#t+1] = StagePanelDisplay("PL1",360-40);
		t[#t+1] = StagePanelDisplay("PL1",360-120);
	elseif GAMESTATE:IsExtraStage2()  then
		t[#t+1] = StagePanelDisplay("PL1",360+160);
		t[#t+1] = StagePanelDisplay("PL1",360+80);
		t[#t+1] = StagePanelDisplay("PL1",360+0);
		t[#t+1] = StagePanelDisplay("PL1",360-80);
		t[#t+1] = StagePanelDisplay("PL1",360-160);
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




return t ;




