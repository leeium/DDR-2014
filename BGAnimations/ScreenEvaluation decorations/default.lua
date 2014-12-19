local t = LoadFallbackB();

t[#t+1] = LoadActor("underlay.png")..{
	InitCommand=cmd(FullScreen);
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
t[#t+1] = LoadActor("LabelP1")..{
		InitCommand=cmd(x,SCREEN_LEFT+80;y,SCREEN_CENTER_Y-268-2;player,PLAYER_1;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,-300);
	};
t[#t+1] = LoadActor("LabelP2")..{
		InitCommand=cmd(x,SCREEN_RIGHT-80;y,SCREEN_CENTER_Y-268-2;player,PLAYER_2;zoom,0.675);
		OffCommand=cmd(linear,0.15;addx,300);
	};
--------µû»ù­Iª©----------
t[#t+1] = LoadActor( THEME:GetPathS("ScreenEvaluation", "music") ) .. {
		OnCommand=cmd(play);
	};

--Sound
t[#t+1] = LoadActor( THEME:GetPathS("ScreenOptions","change" ) ) .. {
		CodeMessageCommand=function(self,params)
		if params.Name=="OpenPanes1"then
			self:play();
		elseif params.Name=="OpenPanes2"then
			self:play();
		elseif params.Name=="OpenPanes3"then
			self:play();
		elseif params.Name=="OpenPanes4"then
			self:play();
		elseif params.Name=="ClosePanes"then
			self:stop();	
		end;
	end;
};
--P1 Frames--
t[#t+1] = LoadActor("DefaultFrame.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-7;x,SCREEN_CENTER_X-330+80+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
};
t[#t+1] = LoadActor("judgment.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-9-9;x,SCREEN_CENTER_X-245;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("cal_back.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-9-9;x,SCREEN_CENTER_X-330-40+30+80+20+5-10;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("Instructions.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
	self:diffusealpha(0);
	else
	self:diffusealpha(1);
	end;
	end;
	};
t[#t+1] = LoadActor("CodeFrame 1x4.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19;x,SCREEN_CENTER_X-330-40+30+80+20+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);animate,false;addx,-10;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
				self:setstate(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
				self:setstate(3);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
--P2 Frames--
t[#t+1] = LoadActor("DefaultFrame.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-7;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
};

t[#t+1] = LoadActor("judgment.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-9-10;x,SCREEN_CENTER_X+245;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("cal_back.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-9-10;x,SCREEN_CENTER_X+330-40+30-80+20-5-10;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("Instructions.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19;x,SCREEN_CENTER_X-330-40+30+80+20+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);addx,-10;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
	self:diffusealpha(0);
	else
	self:diffusealpha(1);
	end;
	end;
	};
t[#t+1] = LoadActor("CodeFrame 1x4.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);animate,false;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
				self:setstate(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
				self:setstate(3);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("grade")..{
	InitCommand=cmd(diffusealpha,1;draworder,11;addy,-15-10-40-15);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(diffusealpha,1;draworder,11;addx,110-20;addy,-30);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	--FCTextP1--
	LoadActor("NFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-355+140;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local pssp1 = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1")
			if pssp1:FullComboOfScore('TapNoteScore_W4') and 
			not pssp1:FullComboOfScore('TapNoteScore_W3') and
			not pssp1:FullComboOfScore('TapNoteScore_W2') and
			not pssp1:FullComboOfScore('TapNoteScore_W1')then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,1))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("GFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-355+140;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if((staw =="StageAward_SingleDigitW3") or (staw =="StageAward_OneW3") or (staw =="StageAward_FullComboW3") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};	
	LoadActor("PFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-355+140;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if((staw =="StageAward_SingleDigitW2") or (staw =="StageAward_OneW2") or (staw =="StageAward_FullComboW2") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("MFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-355+140;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if(staw =="StageAward_FullComboW1") then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);

	};
};
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(diffusealpha,1;draworder,11;addx,-10-20;addy,-30);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	--FCTextP2--
	LoadActor("NFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2")
			if pssp2:FullComboOfScore('TapNoteScore_W4') and 
			not pssp2:FullComboOfScore('TapNoteScore_W3') and
			not pssp2:FullComboOfScore('TapNoteScore_W2') and
			not pssp2:FullComboOfScore('TapNoteScore_W1')then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,1))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("GFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if((staw =="StageAward_SingleDigitW3") or (staw =="StageAward_OneW3") or (staw =="StageAward_FullComboW3") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};	
	LoadActor("PFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if((staw =="StageAward_SingleDigitW2") or (staw =="StageAward_OneW2") or (staw =="StageAward_FullComboW2") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("MFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if(staw =="StageAward_FullComboW1") then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
		end;
		OffCommand=cmd(linear,0.2;zoom,0);

	};
};
--ScoreLabelP1
t[#t+1] = LoadActor("Score_Label")..{
	InitCommand=cmd(diffusealpha,1;draworder,11;x,SCREEN_CENTER_X-320-100-10;y,SCREEN_CENTER_Y-90+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);zoom,0.7);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};
--ScoreLabelP2
t[#t+1] = LoadActor("Score_Label")..{
	InitCommand=cmd(diffusealpha,1;draworder,11;x,SCREEN_CENTER_X+320-80+7;y,SCREEN_CENTER_Y-90+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);zoom,0.7);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};
--CaloriesP1
t[#t+1] = LoadActor("caloriesP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);addy,185-3;zoom,1.25;x,SCREEN_CENTER_X-270+80+20+5;diffusealpha,0);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("kcalP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);y,SCREEN_CENTER_Y+160-7;x,SCREEN_CENTER_X-330+80+5;diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
--CaloriesP2
t[#t+1] = LoadActor("caloriesP2")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);addy,185-3;zoom,1.25;x,SCREEN_CENTER_X+390-80+20-5;diffusealpha,0);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("kcalP2")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);y,SCREEN_CENTER_Y+160-7;x,SCREEN_CENTER_X+330-80-5;diffusealpha,0;zoom,0.675);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
--StatsP1--
t[#t+1] = LoadActor("statsP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);addy,185-3-6;zoom,1.2575;x,SCREEN_CENTER_X-270+80+20+5;diffusealpha,0);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
--StatsP2--
t[#t+1] = LoadActor("statsP2")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);addy,185-3-6;zoom,1.2575;x,SCREEN_CENTER_X+390-80+20-5;diffusealpha,0);
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
--Stage Info P1
t[#t+1] = Def.Sprite{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-10-40;x,SCREEN_CENTER_X-330+80;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);diffusealpha,1;zoom,0.675);
	OnCommand=function(self)
		if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Failed") then
			self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Info_Failed.png"));
		else
			self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Info_Clear.png"));
		end;
	end;
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,-700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
};
--Stage Info P2
t[#t+1] = Def.Sprite{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-10-40;x,SCREEN_CENTER_X+330-80-10;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,1;zoom,0.675);
	OnCommand=function(self)
		if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Failed") then
			self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Info_Failed.png"));
		else
			self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Info_Clear.png"));
		end;
	end;
	OffCommand=cmd(sleep,0.2;linear,0.2;addx,700);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
};
-- rival scores P1
t[#t+1] = LoadActor("scoresP1")..{
		InitCommand=cmd(diffusealpha,0;draworder,3);
		CodeMessageCommand=function(self,params)
		local pn = params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes3"then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
-- rival scores P2
t[#t+1] = LoadActor("scoresP2")..{
		InitCommand=cmd(diffusealpha,0;draworder,3);
		CodeMessageCommand=function(self,params)
		local pn = params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes3"then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
t[#t+1] = Def.Quad{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-50-20-10-5;diffusealpha,1;draworder,1;diffuse,color("#000000");setsize,226,226);
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	};
--song jacket--
t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-50-20-10-5;diffusealpha,1;draworder,1);
	Def.Sprite {
		OnCommand=function(self)
		local course = GAMESTATE:GetCurrentCourse();
		if GAMESTATE:IsCourseMode() then
			if course:GetBackgroundPath() then
				self:Load( course:GetBackgroundPath() )
				self:setsize(220,220);
			else
				-- default to the Banner of the first song in the course
				self:Load(THEME:GetPathG("","Common fallback jacket"));
				self:setsize(220,220);
			end
		else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:setsize(220,220);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(220,220);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(220,220);
					end;
				else
					self:diffusealpha(0);	
			end;
		end;
		end;
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	};
};



t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

--style text
t[#t+1] = LoadFont("_itc avant garde std bk 20px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y-300+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1)diffusealpha,1;shadowlength,1);
	OffCommand=cmd(linear,0.25;diffusealpha,0);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle();
		if style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
			self:settext("DOUBLE");
			self:diffuse(color("#f700d7"));
		elseif style:GetStyleType() == "StyleType_OnePlayerOneSide" then
			self:settext("SINGLE");
			self:diffuse(color("#01b4ff"));
		elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
			self:settext("VERSUS");
			self:diffuse(color("#f78c03"));
		end;
	end;
	};

t[#t+1] = LoadFont("_itc avant garde std bk 20px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y-300+5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2)diffusealpha,1;shadowlength,1);
	OffCommand=cmd(linear,0.25;diffusealpha,0);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle();
		if style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
			self:settext("DOUBLE");
			self:diffuse(color("#f700d7"));
		elseif style:GetStyleType() == "StyleType_OnePlayerOneSide" then
			self:settext("SINGLE");
			self:diffuse(color("#01b4ff"));
		elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
			self:settext("VERSUS");
			self:diffuse(color("#f78c03"));
		end;
	end;
	};	

t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("ScreenEvaluation", "ScoreNumber");
			InitCommand=cmd(x,SCREEN_CENTER_X-310+23;y,SCREEN_CENTER_Y-47.5;zoomx,1;zoomy,0.95;player,PLAYER_1;playcommand,"Set");
			SetCommand = function(self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
				self:Load("RollingNumbersEvaluation");
				self:targetnumber(score);
			end;
			OffCommand=cmd(sleep,0.067;zoom,0);
		};
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("ScreenEvaluation", "ScoreNumber");
			InitCommand=cmd(x,SCREEN_CENTER_X+310+75;y,SCREEN_CENTER_Y-47.5;zoomx,1;zoomy,0.95;player,PLAYER_2;playcommand,"Set");
			SetCommand = function(self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
				self:Load("RollingNumbersEvaluation");
				self:targetnumber(score);
			end;
			OffCommand=cmd(sleep,0.067;zoom,0);
		};

if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.StepsDisplay {
			InitCommand=cmd(Load,"StepsDisplayEvaluation",pn;SetFromGameState,pn;);
			UpdateNetEvalStatsMessageCommand=function(self,param)
				if GAMESTATE:IsPlayerEnabled(pn) then
					self:SetFromSteps(param.Steps)
				end;
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "StepsDisplay" .. ToEnumShortString(pn), t2 );
	end
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "StageAward" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "StageAward"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local tStats = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats() or STATSMAN:GetCurStageStats();
			tStats = tStats:GetPlayerStageStats(pn);
			if tStats:GetStageAward() then
				self:settext( THEME:GetString( "StageAward", ToEnumShortString( tStats:GetStageAward() ) ) );
			else
				self:settext( "" );
			end
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PeakComboAward" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PeakComboAward"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local tStats = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats() or STATSMAN:GetCurStageStats();
			tStats = tStats:GetPlayerStageStats(pn);
			if tStats:GetPeakComboAward() then
				self:settext( THEME:GetString( "PeakComboAward", ToEnumShortString( tStats:GetPeakComboAward() ) ) );
			else
				self:settext( "" );
			end
		end;
	};
end

--song title black--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-70-2;zoom,1;diffuse,color("#000000");strokecolor,color("#ffffff"));
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	OnCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayMainTitle();
			end;
			self:diffusealpha(1);
			self:maxwidth(350);
			self:settext(tit);
			self:diffuse(Color("Black"));
		else
			self:diffusealpha(0);
		end;
	end;
};
if not GAMESTATE:IsCourseMode() then
--artist--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+30-70-5;zoom,0.8;diffuse,color("#000000");strokecolor,color("#ffffff");draworder,2);
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	OnCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayArtist();
			end;
			self:diffusealpha(1);
			self:maxwidth(400);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};
end;
t[#t+1] = StandardDecorationFromFileOptional("GameType","GameType");
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra1" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and not GAMESTATE:IsExtraStage() and GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra2" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra2" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};
return t