local t = LoadFallbackB();

-- Legacy StepMania 4 Function
--???
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState( player );
	end

	local t = Def.StepsDisplay {
		InitCommand=cmd(Load,"StepsDisplay",GAMESTATE:GetPlayerState(pn););
	};

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		t.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return t;
end
t[#t+1] = StandardDecorationFromFileOptional("AlternateHelpDisplay","AlternateHelpDisplay");
t[#t+1] = StandardDecorationFromFileOptional("BannerFrame","BannerFrame");

--default difficulty stuff
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

local function GetDifListX(self,pn,offset,fade)
	if pn==PLAYER_1 then
		self:x(SCREEN_LEFT+150-offset);
		if fade>0 then
			self:faderight(fade);
		end;
	else
		self:x(SCREEN_RIGHT-150+offset);
		if fade>0 then
			self:fadeleft(fade);
		end;
	end;
	return r;
end;

local function DrawDifList(pn,diff)
	local t=Def.ActorFrame {
		InitCommand=cmd(player,pn;y,SCREEN_CENTER_Y-150-43.5-25);
--meter
	LoadFont("_itc avant garde std bk 20px")..{
		InitCommand=cmd(diffuse,color("#000000");strokecolor,Color("White");zoom,0.9);
		SetCommand=function(self)
		local st=GAMESTATE:GetCurrentStyle():GetStepsType();
		local song=GAMESTATE:GetCurrentSong();
		local course = GAMESTATE:GetCurrentCourse();
		if song then
			GetDifListX(self,pn,110,0);
			self:y(GetDifListY(diff, st, song));
			if song:HasStepsTypeAndDifficulty(st,diff) then
			local steps = song:GetOneSteps( st, diff );
				self:settext(steps:GetMeter());
			else
				self:settext("");
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
	};
	return t;
end;
if not GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor("DiffBlocks.png")..{
	InitCommand=cmd(player,PLAYER_1;vertalign,top;x,SCREEN_LEFT+14;y,SCREEN_CENTER_Y-160-43-6.5-25;zoom,0.66);
	OffCommand=cmd(linear,0.25;addx,-500);
	};
t[#t+1] = LoadActor("DiffBlocks.png")..{
	InitCommand=cmd(player,PLAYER_2;vertalign,top;x,SCREEN_RIGHT-14;y,SCREEN_CENTER_Y-160-43-6.5-25;zoom,0.66);
	OffCommand=cmd(linear,0.25;addx,500);
	};	
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Beginner')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Easy')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Medium')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Hard')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Challenge')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Edit')..{
	OffCommand=cmd(linear,0.25;addx,-500);
	};

	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Beginner')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Easy')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Medium')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Hard')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Challenge')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
	t[#t+1]=DrawDifList(PLAYER_2,'Difficulty_Edit')..{
	OffCommand=cmd(linear,0.25;addx,500);
	};
--default meter stuff
t[#t+1] = LoadActor("GRP1")..{
	InitCommand=cmd(x,SCREEN_LEFT+260-15;y,SCREEN_CENTER_Y-80;player,PLAYER_1;draworder,-1;diffusealpha,0.8;zoom,0.96);
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	};
t[#t+1] = LoadActor("GRP2")..{
	InitCommand=cmd(x,SCREEN_RIGHT-260+15;y,SCREEN_CENTER_Y-80;player,PLAYER_2;draworder,-1;diffusealpha,0.8;zoom,0.96);
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	};
--default radar
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP1_Default", "GrooveRadarP1_Default" );
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP2_Default", "GrooveRadarP2_Default" );
--Meterp1
t[#t+1] = LoadFont("ScreenSelectMusic meter") .. {
	InitCommand=cmd(x,SCREEN_LEFT+260-15;y,SCREEN_CENTER_Y-100;player,PLAYER_1;diffuse,color("#000000"));
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if GAMESTATE:IsHumanPlayer(PLAYER_1) then
			local meter = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
				self:settext(meter);
			else
				self:settext("");
			end;
		else
			self:settext("");
		end;
	end;
};
--descriptionP1
t[#t+1] = LoadFont("ScreenSelectMusic meter") .. {
	InitCommand=cmd(x,SCREEN_LEFT+260-15;y,SCREEN_CENTER_Y-190-13;player,PLAYER_1;diffuse,color("#000000");zoom,0.575;maxwidth,480;shadowlengthy,3);
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if GAMESTATE:IsHumanPlayer(PLAYER_1) then
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
				self:settextf("%s",THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
				self:diffuse(CustomDifficultyToColor(diff));
			else
				self:settext("");
			end;
		else
			self:settext("");
		end;
	end;
};
--Meterp2
t[#t+1] = LoadFont("ScreenSelectMusic meter") .. {
	InitCommand=cmd(x,SCREEN_RIGHT-260+15;y,SCREEN_CENTER_Y-100;player,PLAYER_2;diffuse,color("#000000"));
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if GAMESTATE:IsHumanPlayer(PLAYER_2) then
			local meter = GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter();
				self:settext(meter);
			else
				self:settext("");
			end;
		else
			self:settext("");
		end;
	end;
};
--descriptionP2
t[#t+1] = LoadFont("ScreenSelectMusic meter") .. {
	InitCommand=cmd(x,SCREEN_RIGHT-260+15;y,SCREEN_CENTER_Y-190-13;player,PLAYER_2;diffuse,color("#000000");zoom,0.575;maxwidth,480;shadowlengthy,3);
	OffCommand=cmd(bouncebegin,0.25;zoom,0);
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if GAMESTATE:IsHumanPlayer(PLAYER_2) then
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
				self:settextf("%s",THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
				self:diffuse(CustomDifficultyToColor(diff));
			else
				self:settext("");
			end;
		else
			self:settext("");
		end;
	end;
};
end;
t[#t+1] = LoadActor("LabelP1")..{
		InitCommand=cmd(x,SCREEN_LEFT+80+5;y,SCREEN_CENTER_Y-268-3;player,PLAYER_1;zoom,0.67);
		OffCommand=cmd(linear,0.15;addx,-300);
	};
t[#t+1] = LoadActor("LabelP2")..{
		InitCommand=cmd(x,SCREEN_RIGHT-80-5;y,SCREEN_CENTER_Y-268-3;player,PLAYER_2;zoom,0.67);
		OffCommand=cmd(linear,0.15;addx,300);
	};
--arrows--
t[#t+1] = LoadActor("arrow.png") .. {
		InitCommand=cmd(draworder,200;x,SCREEN_CENTER_X+90;y,SCREEN_BOTTOM-160;zoom,0.25);
		OnCommand=cmd(bounce;effectmagnitude,8,0,0;effectclock,'beatnooffset');
		OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	};
t[#t+1] = LoadActor("arrow.png") .. {
		InitCommand=cmd(draworder,200;x,SCREEN_CENTER_X-90;y,SCREEN_BOTTOM-160;rotationy,180;zoom,0.25);
		OnCommand=cmd(bounce;effectmagnitude,-8,0,0;effectclock,'beatnooffset');
		OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	};
t[#t+1] = LoadActor("press.png") .. {
		InitCommand=cmd(diffusealpha,0;draworder,201;x,SCREEN_CENTER_X+90;y,SCREEN_BOTTOM-150;zoom,0.25);
		OnCommand=cmd(bounce;effectmagnitude,8,0,0;effectclock,'beatnooffset');
		NextSongMessageCommand=cmd(stoptweening;linear,0;diffusealpha,1;decelerate,0.5;diffusealpha,0);
	};
t[#t+1] = LoadActor("press.png") .. {
		InitCommand=cmd(diffusealpha,0;draworder,201;x,SCREEN_CENTER_X-90;y,SCREEN_BOTTOM-150;rotationy,180;zoom,0.25);
		OnCommand=cmd(bounce;effectmagnitude,-8,0,0;effectclock,'beatnooffset');
		PreviousSongMessageCommand=cmd(stoptweening;linear,0;diffusealpha,1;decelerate,0.5;diffusealpha,0);
	};
t[#t+1] = LoadActor("Information.png")..{
		InitCommand=cmd(x,SCREEN_RIGHT-230;y,SCREEN_CENTER_Y-90;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);diffusealpha,0.8;zoom,0.8);
		OnCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			if style == "StyleType_TwoPlayersTwoSides" then
				self:diffusealpha(0);
			else
				self:diffusealpha(0.8);
			end;
		end;
		OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
t[#t+1] = LoadActor("Information.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+230;y,SCREEN_CENTER_Y-90;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,0.8;zoom,0.8);
		OnCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			if style == "StyleType_TwoPlayersTwoSides" then
				self:diffusealpha(0);
			else
				self:diffusealpha(0.8);
			end;
		end;
		OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
if not GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor("PaneNumbers")..{
		InitCommand=cmd(x,SCREEN_LEFT+351-100-12-6-3;y,SCREEN_CENTER_Y-90-164-20+10;diffusealpha,0;zoom,0.85;draworder,2;player,PLAYER_1;animate,false);
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
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,-500);
};
t[#t+1] = LoadActor("PaneNumbers")..{
		InitCommand=cmd(x,SCREEN_RIGHT-351+100+12+6-60-40+2;y,SCREEN_CENTER_Y-90-164-20+10;diffusealpha,0;zoom,0.85;draworder,2;player,PLAYER_2;animate,false);
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
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
};	
t[#t+1] = LoadActor("PaneFrameBase 3x1")..{
		InitCommand=cmd(x,SCREEN_LEFT-250;y,SCREEN_CENTER_Y-90-15-4;diffusealpha,0;zoomx,0.8;zoomy,0.7;draworder,2;player,PLAYER_1;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle();
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
				self:linear(0.15);
				self:x(SCREEN_LEFT+190-38);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
				self:setstate(1);
				self:linear(0.15);
				self:x(SCREEN_LEFT+190-38);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
				self:linear(0.15);
				self:x(SCREEN_LEFT+190-38);
			elseif params.Name=="ClosePanes"then
				self:linear(0.15);
				self:x(SCREEN_LEFT-250);
			end;				
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,-500);
};	
t[#t+1] = LoadActor("PaneFrameBase 3x1")..{
		InitCommand=cmd(x,SCREEN_RIGHT+250;y,SCREEN_CENTER_Y-90-15-4;diffusealpha,0;zoomx,0.8;zoomy,0.7;draworder,2;player,PLAYER_2;rotationy,180;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle();
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
				self:linear(0.15);
				self:x(SCREEN_RIGHT-190+38);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
				self:setstate(1);
				self:linear(0.15);
				self:x(SCREEN_RIGHT-190+38);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
				self:linear(0.15);
				self:x(SCREEN_RIGHT-190+38);
			elseif params.Name=="ClosePanes"then
				self:linear(0.15);
				self:x(SCREEN_RIGHT+250);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
};	
end;
--Sound
t[#t+1] = LoadActor( THEME:GetPathS("","Pane Sound" ) ) .. {
		CodeMessageCommand=function(self,params)
		if params.Name=="OpenPanes1"then
			self:play();
		elseif params.Name=="OpenPanes2"then
			self:play();
		elseif params.Name=="OpenPanes3"then
			self:play();
		elseif params.Name=="ClosePanes"then
			self:stop();	
		end;
	end;
};
--for course mode
if GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor("Course_PaneNumbers")..{
		InitCommand=cmd(x,SCREEN_LEFT+351-100-12-6-3;y,SCREEN_CENTER_Y-90-164-20+10;diffusealpha,1;zoom,0.85;draworder,2;player,PLAYER_1;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,-500);
};
t[#t+1] = LoadActor("Course_PaneNumbers")..{
		InitCommand=cmd(x,SCREEN_RIGHT-351+100+12+6-60-40+2;y,SCREEN_CENTER_Y-90-164-20+10;diffusealpha,1;zoom,0.85;draworder,2;player,PLAYER_2;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
};	
t[#t+1] = LoadActor("PaneFrameBase 3x1")..{
		InitCommand=cmd(x,SCREEN_LEFT+190-38;y,SCREEN_CENTER_Y-90-15-4;diffusealpha,1;zoomx,0.8;zoomy,0.7;draworder,2;player,PLAYER_1;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle();
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
				self:linear(0.15);
				self:x(SCREEN_LEFT+190-38);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
				self:linear(0.15);
				self:x(SCREEN_LEFT+190-38);
			end;				
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,-500);
};	
t[#t+1] = LoadActor("PaneFrameBase 3x1")..{
		InitCommand=cmd(x,SCREEN_RIGHT-190+38;y,SCREEN_CENTER_Y-90-15-4;diffusealpha,1;zoomx,0.8;zoomy,0.7;draworder,2;player,PLAYER_2;rotationy,180;animate,false);
		CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle();
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
				self:setstate(0);
				self:linear(0.15);
				self:x(SCREEN_RIGHT-190+38);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(1);
				self:setstate(2);
				self:linear(0.15);
				self:x(SCREEN_RIGHT-190+38);
			end;
		end;
	end;
	OffCommand=cmd(sleep,0.15;linear,0.25;addx,500);
};	
end;
if not GAMESTATE:IsCourseMode() then
--Codes
t[#t+1] = LoadActor("radarP1")..{
		InitCommand=cmd(diffusealpha,0;draworder,3;addy,-23);
		CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
			if song then
				self:zoom(1.1);
			else
				self:zoom(1.1);
			end;
		end;
		CodeMessageCommand=function(self,params)
		if params.PlayerNumber==PLAYER_1 then
			if params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
t[#t+1] = LoadActor("radarP2")..{
		InitCommand=cmd(diffusealpha,0;draworder,3;addy,-23);
		CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
			if song then
				self:zoom(1.1);
			else
				self:zoom(1.1);
			end;
		end;
		CodeMessageCommand=function(self,params)
		if params.PlayerNumber==PLAYER_2 then
			if params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
for pn in ivalues( GAMESTATE:GetHumanPlayers() ) do
t[#t+1] = LoadActor("Difficulty.lua", pn)..{
InitCommand=cmd(diffusealpha,0; draworder,3; addy,-19),
}
end
end;
t[#t+1] = LoadActor("scoresP1")..{
		InitCommand=cmd(diffusealpha,0;draworder,3;addy,-30;addx,5);
		CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
			if song then
				self:zoom(1);
			else
				self:zoom(1);
			end;
		end;
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
t[#t+1] = LoadActor("scoresP2")..{
		InitCommand=cmd(diffusealpha,0;draworder,3;addy,-30;addx,-5);
		CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
			if song then
				self:zoom(1);
			else
				self:zoom(1);
			end;
		end;
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
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("BPMLabel","BPMLabel");
t[#t+1] = StandardDecorationFromFileOptional("SegmentDisplay","SegmentDisplay");
t[#t+1] = StandardDecorationFromFileOptional("ShockArrowDisplayP1","ShockArrowDisplayP1");
t[#t+1] = StandardDecorationFromFileOptional("ShockArrowDisplayP2","ShockArrowDisplayP2");
--song jacket border
t[#t+1] = Def.Quad{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-15-8;diffusealpha,1;draworder,1;diffuse,color("#000000");setsize,310,310);
	CurrentSongChangedMessageCommand=cmd(playcommand,"On");
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	Condition=not GAMESTATE:IsCourseMode();
	};
--song jacket
t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-15-8;diffusealpha,1;draworder,1);
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	Def.Banner {
		SetCommand=function(self)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:zoomtowidth(304);
						self:zoomtoheight(304);							
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:zoomtowidth(304);
						self:zoomtoheight(304);							
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(304);
						self:zoomtoheight(304);							
					end;
				else
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(304);
						self:zoomtoheight(304);							
				end;
		else
			self:diffusealpha(0);
		end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
	Def.Banner {
		SetCommand=function(self)
		local course = GAMESTATE:GetCurrentCourse();
			if course then
				self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
						self:zoomtowidth(304);
						self:zoomtoheight(304);				
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
};
--new song--
if not GAMESTATE:IsCourseMode() then
	t[#t+1] = StandardDecorationFromFileOptional("NewSong","NewSong") .. {
	-- 	ShowCommand=THEME:GetMetric(Var "LoadingScreen", "NewSongShowCommand" );
	-- 	HideCommand=THEME:GetMetric(Var "LoadingScreen", "NewSongHideCommand" );
		InitCommand=cmd(playcommand,"Set");
		BeginCommand=cmd(playcommand,"Set");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
	-- 		local pTargetProfile;
			local sSong;
			-- Start!
			if GAMESTATE:GetCurrentSong() then
				if PROFILEMAN:IsSongNew(GAMESTATE:GetCurrentSong()) then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			else
				self:playcommand("Hide");
			end
		end;
	};
	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
end;


t[#t+1] = StandardDecorationFromFileOptional("DifficultyDisplay","DifficultyDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SortOrderFrame","SortOrderFrame") .. {
--[[ 	BeginCommand=cmd(playcommand,"Set");
	SortOrderChangedMessageCommand=cmd(playcommand,"Set";);
	SetCommand=function(self)
		local s = SortOrderToLocalizedString( GAMESTATE:GetSortOrder() );
		self:settext( s );
		self:playcommand("Sort");
	end; --]]
};
t[#t+1] = StandardDecorationFromFileOptional("SortOrder","SortOrderText") .. {
	BeginCommand=cmd(playcommand,"Set");
	SortOrderChangedMessageCommand=cmd(playcommand,"Set";);
	SetCommand=function(self)
		local s = SortOrderToLocalizedString( GAMESTATE:GetSortOrder() );
		self:settext( s );
		self:playcommand("Sort");
	end;
};
t[#t+1] = StandardDecorationFromFileOptional("SongOptionsFrame","SongOptionsFrame") .. {
	ShowPressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsFrameShowCommand");
	ShowEnteringOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsFrameEnterCommand");
	HidePressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsFrameHideCommand");
};
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptionsText") .. {
	ShowPressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsShowCommand");
	ShowEnteringOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsEnterCommand");
	HidePressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsHideCommand");
};
--gradient--
t[#t+1] = Def.Quad{
	InitCommand=cmd(horizalign,left;x,SCREEN_LEFT+100-50;y,SCREEN_BOTTOM-255-25;setsize,170,26;faderight,1);
	OnCommand=cmd(addx,-300;linear,0.15;addx,300);
	OffCommand=cmd(linear,0.15;addx,-300);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local group;
	local so = GAMESTATE:GetSortOrder();
	if not GAMESTATE:IsCourseMode() then
		if song then 
			if so == "SortOrder_Group" then
				self:diffuse(color("#195c64"));
			elseif so == "SortOrder_Title" then
				self:diffuse(color("#f98b2d"));
			elseif so == "SortOrder_Artist" then
				self:diffuse(color("#f98b2d"));
			elseif so == "SortOrder_BPM" then
				self:diffuse(color("#2ed1b4"));
			elseif so == "SortOrder_BeginnerMeter" or so == "SortOrder_EasyMeter" or so == "SortOrder_MediumMeter" or so == "SortOrder_HardMeter" or so == "SortOrder_ChallengeMeter" then
				self:diffuse(color("#2d56d1"));
			elseif so == "SortOrder_Popularity" then
				self:diffuse(color("#be32f9"));
			elseif so == "SortOrder_TopGrades" then
				self:diffuse(color("#7bd128"));
			elseif so == "SortOrder_Genre" then
				self:diffuse(color("#008392"));
			else
			end;
		end;
	else
		self:diffusealpha(0);
	end;
	end;
	};
--group title--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,left;x,SCREEN_LEFT+100-45;y,SCREEN_BOTTOM-255-25;zoom,0.8;diffuse,color("#ffffff");draworder,999);
	OnCommand=cmd(addx,-300;linear,0.15;addx,300);
	OffCommand=cmd(linear,0.15;addx,-300);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local group;
	local so = GAMESTATE:GetSortOrder();
	local group_colors= {
		["SortOrder_Group"]= "#195c64",
		["SortOrder_Title"]= "#864b21",
		["SortOrder_Artist"]= "#864b21",
		["SortOrder_BPM"]= "#006a56",
		["SortOrder_BeginnerMeter"]= "#1e1e68",
		["SortOrder_EasyMeter"]= "#1e1e68",
		["SortOrder_MediumMeter"]= "#1e1e68",
		["SortOrder_HardMeter"]= "#1e1e68",
		["SortOrder_ChallengeMeter"]= "#1e1e68",
		["SortOrder_Popularity"]= "#2e0d54",
		["SortOrder_TopGrades"]= "#254f07",
		["SortOrder_Genre"]= "#015b61",
	}
	if song then
		local color_str= group_colors[GAMESTATE:GetSortOrder()] or "#000000"
		self:maxwidth(300);
		self:strokecolor(color(color_str));
		if so == "SortOrder_Group" then
			if song:GetGroupName() == "DanceDanceRevolution 1stMIX" then
				self:settext("Version/DDR 1st")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 2ndMIX" then
				self:settext("Version/2ndMIX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 3rdMIX + VER.Korea" or song:GetGroupName() == "DanceDanceRevolution 3rdMIX" then
				self:settext("Version/3rdMIX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 4thMIX" then
				self:settext("Version/4thMIX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 5thMIX" then
				self:settext("Version/5thMIX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 6thMIX MAX" then
				self:settext("Version/MAX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 7thMIX MAX2" then
				self:settext("Version/MAX2 ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution 8thMIX EXTREME" then
				self:settext("Version/EXTREME ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution SuperNOVA" then
				self:settext("Version/SuperNOVA ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution SuperNOVA2" then
				self:settext("Version/SuperNOVA2 ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution X" then
				self:settext("Version/X ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution X2" then
				self:settext("Version/X2 ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DanceDanceRevolution X3" or song:GetGroupName() == "DanceDanceRevolution X3 VS 2ndMIX" then
				self:settext("Version/X3 vs 2ndMIX ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DDR 2013" then
				self:settext("Version/DDR 2013 ")
				self:diffusealpha(1);
			elseif song:GetGroupName() == "DDR 2014" then
				self:settext("Version/DDR ")
				self:diffusealpha(1);
			else
				self:settext("Version/"..song:GetGroupName());
				self:diffusealpha(1);
			end
		elseif so == "SortOrder_Title" then
				self:settext("Song Title/");
		elseif so == "SortOrder_Artist" then
				self:settext("Artist/");
		elseif so == "SortOrder_BPM" then
				self:settext("BPM");
		elseif so == "SortOrder_BeginnerMeter" then
				self:settext("Beginner/");
		elseif so == "SortOrder_EasyMeter" then
				self:settext("Basic/");
		elseif so == "SortOrder_MediumMeter" then
				self:settext("Difficult/");
		elseif so == "SortOrder_HardMeter" then
				self:settext("Expert/");
		elseif so == "SortOrder_ChallengeMeter" then
				self:settext("Challenge/");
		elseif so == "SortOrder_Popularity" then
				self:settext("Popularity/");
		elseif so == "SortOrder_TopGrades" then
				self:settext("Cleared Rank/");
		elseif so == "SortOrder_Genre" then
				self:settext("Genre/");
			end;	
		else
			self:settext("");
		end
	end;	
};	
--[[--song title black--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+70;zoom,1;diffuse,color("#000000");strokecolor,color("#ffffff"));
	OnCommand=cmd(playcommand,"CurrentSongChangedMessage");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
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
			self:maxwidth(SCREEN_WIDTH-80);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};
--artist--
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+100;zoom,0.8;diffuse,color("#000000");strokecolor,color("#ffffff");draworder,2);
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
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
			self:maxwidth(SCREEN_WIDTH-80);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};--]]

local ut = Def.ActorFrame{
	LoadFont("Common Normal")..{
		Name="songTitle";
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+70-30;zoom,1;diffuse,color("#000000");strokecolor,color("#ffffff"));
		OffCommand=cmd(decelerate,0.05;addy,900);
		SetCommand=function(self)
			local song;
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayMainTitle();
			end;
			self:maxwidth(400);
			self:settextf("%s",tit);
		end;
	};
	LoadFont("Common Normal")..{
		Name="songArtist";
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+90-30;zoom,0.8;diffuse,color("#000000");strokecolor,color("#ffffff");draworder,2);
		OffCommand=cmd(decelerate,0.05;addy,900);
		SetCommand=function(self)
			local song;
			local sub="";
			local art="";
			if GAMESTATE:IsCourseMode() then
			else
				song=GAMESTATE:GetCurrentSong();
				sub=song:GetDisplaySubTitle();
				art=song:GetDisplayArtist();
				self:settextf("%s\n%s",sub,art);
			end;
		end;
	};
};


--ºq¦±¼ÐÃD§@ªÌ
local function updateTitle(self)
	local upTit = self:GetChild("songTitle");
	local upArt = self:GetChild("songArtist");
	local curSelection = GAMESTATE:GetCurrentSong();
	local curSelCourse = GAMESTATE:GetCurrentCourse();
	upTit:maxwidth(330);
	upArt:maxwidth(330);
	if curSelection or curSelCourse then
		local song;
		local tit="";
		local sub="";
		local art="";
		if GAMESTATE:IsCourseMode() then
			song=GAMESTATE:GetCurrentCourse();
			tit=song:GetDisplayFullTitle();
			upTit:settextf("%s",tit);
		else
			song=GAMESTATE:GetCurrentSong();
			tit=song:GetDisplayMainTitle();
			sub=song:GetDisplaySubTitle();
			art=song:GetDisplayArtist();
			upTit:settextf("%s",tit..sub);
		end;
		upTit:diffuse(color("0.15,0.15,0.15,1"));
		upTit:strokecolor(Color("White"));
		
		upArt:settextf("\n%s",art);
		upArt:diffuse(color("0.15,0.15,0.15,1"));
		upArt:strokecolor(Color("White"));
	else
		upTit:settext("");
		upArt:settext("");
	end;
end;

ut.InitCommand=cmd(SetUpdateFunction,updateTitle);


t[#t+1] = ut;

t[#t+1] = LoadActor("Tip_Song")..{
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	if song then
		self:playcommand("On");
		self:stoptweening();
		self:diffusealpha(1);
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y+85);
		self:draworder(999);
	else
		self:diffusealpha(0);
	end;
	end;
	OnCommand=cmd(zoomx,0.6;zoomy,0;sleep,3;linear,0.15;zoomy,0.65;bounce;effectmagnitude,0,3,0);
	OffCommand=cmd(linear,0.15;zoomy,0);
	};

if GAMESTATE:IsCourseMode() then
t[#t+1] = StandardDecorationFromFileOptional("CourseContentsListP1","CourseContentsListP1")..{
		InitCommand=cmd(diffusealpha,1;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);draworder,101;zoom,0.8;addy,90);
		CodeMessageCommand=function(self,params)
		local pn = params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
t[#t+1] = StandardDecorationFromFileOptional("CourseContentsListP2","CourseContentsListP2")..{
		InitCommand=cmd(diffusealpha,1;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);draworder,101;zoom,0.8;addy,90);
		CodeMessageCommand=function(self,params)
		local pn = params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);			
			else
				self:diffusealpha(0);
			end;
		end;
	end;
};
end;
--grades
t[#t+1] = Def.ActorFrame {
InitCommand=cmd(addy,-110);
	Def.Quad{
	InitCommand=cmd(zoom,0.8;shadowlength,1;x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y+100;horizalign,center;draworder,2);
	OffCommand=cmd(bouncebegin,0.15;zoom,0);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_1);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
					-- player profile
					profile = PROFILEMAN:GetProfile(PLAYER_1);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
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
--p2
	Def.Quad{
	InitCommand=cmd(zoom,0.8;shadowlength,1;x,SCREEN_CENTER_X+204;y,SCREEN_CENTER_Y+100;horizalign,center;draworder,2);
	OffCommand=cmd(bouncebegin,0.15;zoom,0);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_2);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_2);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
					-- player profile
					profile = PROFILEMAN:GetProfile(PLAYER_2);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
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
};


return t;
