return Def.ActorFrame {
	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
					MESSAGEMAN:Broadcast("StartButton");
				end;
			else
				SCREENMAN:GetTopScreen():Finish();
				MESSAGEMAN:Broadcast("StartButton");
			end;
		end;
		end;
--P1Stuff
Def.ActorFrame {
InitCommand=cmd(x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y+9);
OffCommand=function(self)
if PROFILEMAN:GetNumLocalProfiles() == 0 then
	(cmd(sleep,0.5;linear,0.3;zoomy,0))(self);
else
	self:diffusealpha(1);
end;
end;
	LoadActor("Back") .. {
	InitCommand=cmd(diffusealpha,0.8;scaletoclipped,374,526);
	OnCommand=cmd(zoomy,0;linear,0.3;zoomy,1);
	};
	LoadActor("Bar") .. {
	InitCommand=cmd(scaletoclipped,380,34);
	OnCommand=cmd(linear,0.3;addy,-255);	
	};
	LoadActor("Bar") .. {
	InitCommand=cmd(scaletoclipped,380,34);
	OnCommand=cmd(linear,0.3;addy,255);	
	};
	LoadActor("Start")..{
	InitCommand=cmd(diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.5;draworder,50);
	OnCommand=function(self)
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		self:visible(false);
	else
		self:visible(true);
	end;
	end;
	};
};
Def.ActorFrame {
InitCommand=cmd(x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y+9;visible,GAMESTATE:IsHumanPlayer(PLAYER_1));
--Loading info
	LoadActor("Info")..{
	InitCommand=cmd();
	OnCommand=cmd(zoomx,1;zoomy,0;sleep,0.5;linear,0.15;zoomy,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.25;zoomy,0;zoomx,0.8);
	};
	LoadActor("Load 4x1")..{
	InitCommand=cmd(addx,-90;addy,-15;zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;animate,true;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
	LoadFont("Common Normal")..{
	Text="Loading";
	InitCommand=cmd(addy,-15;diffuse,color("#00ff2a");zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
	LoadFont("Common Normal")..{
	Text="Please be patient.";
	InitCommand=cmd(addy,15;zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
--Loaded info
	LoadActor("Info")..{
	InitCommand=cmd();
	OnCommand=cmd(zoomx,1;zoomy,0;sleep,5.5;linear,0.15;zoomy,1;sleep,3;playcommand,"Off");
	OffCommand=cmd(linear,0.25;zoomy,0;zoomx,0.8);
	};
	LoadFont("Common Normal")..{
	InitCommand=cmd(zoom,0.8);
	OnCommand=function(self)
	if PROFILEMAN:GetNumLocalProfiles() == 0 then
		self:settext("No profiles available.");
		(cmd(diffusealpha,0;sleep,5.5;linear,0.15;diffusealpha,1;sleep,3;playcommand,"Off"))(self);
	else
		self:settext("Profiles Loaded.");
		(cmd(diffusealpha,0;sleep,5.5;linear,0.15;diffusealpha,1;sleep,3;playcommand,"Off"))(self);
	end;
	end;
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
};
--P2Stuff
Def.ActorFrame {
InitCommand=cmd(x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y+9);
OffCommand=function(self)
if PROFILEMAN:GetNumLocalProfiles() == 0 then
	(cmd(sleep,0.5;linear,0.3;zoomy,0))(self);
else
	self:diffusealpha(1);
end;
end;
	LoadActor("Back") .. {
	InitCommand=cmd(diffusealpha,0.8;scaletoclipped,374,526);
	OnCommand=cmd(zoomy,0;linear,0.3;zoomy,1);
	};
	LoadActor("Bar") .. {
	InitCommand=cmd(scaletoclipped,380,34);
	OnCommand=cmd(linear,0.3;addy,-255);	
	};
	LoadActor("Bar") .. {
	InitCommand=cmd(scaletoclipped,380,34);
	OnCommand=cmd(linear,0.3;addy,255);	
	};
	LoadActor("Start")..{
	InitCommand=cmd(diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.5;draworder,50);
	OnCommand=function(self)
	if GAMESTATE:IsHumanPlayer(PLAYER_2) then
		self:visible(false);
	else
		self:visible(true);
	end;
	end;
	};
};
Def.ActorFrame {
InitCommand=cmd(x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y+9;visible,GAMESTATE:IsHumanPlayer(PLAYER_2));
--Loading info
	LoadActor("Info")..{
	InitCommand=cmd();
	OnCommand=cmd(zoomx,1;zoomy,0;sleep,0.5;linear,0.15;zoomy,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.25;zoomy,0;zoomx,0.8);
	};
	LoadActor("Load 4x1")..{
	InitCommand=cmd(addx,-90;addy,-15;zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;animate,true;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
	LoadFont("Common Normal")..{
	Text="Loading";
	InitCommand=cmd(addy,-15;diffuse,color("#00ff2a");zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
	LoadFont("Common Normal")..{
	Text="Please be patient.";
	InitCommand=cmd(addy,15;zoom,0.8);
	OnCommand=cmd(diffusealpha,0;sleep,0.65;diffusealpha,1;sleep,4.5;playcommand,"Off");
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
--Loaded info
	LoadActor("Info")..{
	InitCommand=cmd();
	OnCommand=cmd(zoomx,1;zoomy,0;sleep,5.5;linear,0.15;zoomy,1;sleep,3;playcommand,"Off");
	OffCommand=cmd(linear,0.25;zoomy,0;zoomx,0.8);
	};
	LoadFont("Common Normal")..{
	InitCommand=cmd(zoom,0.8);
	OnCommand=function(self)
	if PROFILEMAN:GetNumLocalProfiles() == 0 then
		self:settext("No profiles available.");
		(cmd(diffusealpha,0;sleep,5.5;linear,0.15;diffusealpha,1;sleep,3;playcommand,"Off"))(self);
	else
		self:settext("Profiles Loaded.");
		(cmd(diffusealpha,0;sleep,5.5;linear,0.15;diffusealpha,1;sleep,3;playcommand,"Off"))(self);
	end;
	end;
	OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
};
	Def.Actor {
	BeginCommand=function(self)
			self:sleep(8);
			self:queuecommand("Load");	
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};
};