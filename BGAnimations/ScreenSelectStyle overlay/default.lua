local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
---------------------------------- Explanation Frame -------------------------
---------- SOUND ----------
    
---------- BACK ----------
    LoadActor("ExplFrame") .. {
        InitCommand=cmd(draworder,200;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;vertalign,bottom);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    };
------------------------- FOR PLAYER 1 -------------
---- P1 TEXT HERE -------	
    LoadActor("P1here") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
        InitCommand=cmd(draworder,200;x,SCREEN_LEFT;y,SCREEN_BOTTOM;horizalign,left;vertalign,bottom;);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    };
	LoadActor("P1here") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_1);
        InitCommand=cmd(draworder,200;x,SCREEN_LEFT;y,SCREEN_BOTTOM;horizalign,left;vertalign,bottom;diffusealpha,0);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(linear,0.15;diffusealpha,1;))(self);
				end;
			end;
    };
---- P1 TEXT NOHERE ------	
	LoadActor("P1Nohere") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_1);
        InitCommand=cmd(draworder,200;x,SCREEN_LEFT;y,SCREEN_BOTTOM;horizalign,left;vertalign,bottom;);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(linear,0.15;diffusealpha,0;))(self);
				end;
			end;
    };
------------------------- FOR PLAYER 2 -------------
---- P1 TEXT HERE -------	
    LoadActor("P2here") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
        InitCommand=cmd(draworder,200;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;horizalign,right;vertalign,bottom;);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    };
	LoadActor("P2here") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_2);
        InitCommand=cmd(draworder,200;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;horizalign,right;vertalign,bottom;diffusealpha,0);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(linear,0.15;diffusealpha,1;))(self);
				end;
			end;
    };
---- P1 TEXT NOHERE ------	
	LoadActor("P2Nohere") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_2);
        InitCommand=cmd(draworder,200;x,SCREEN_RIGHT;y,SCREEN_BOTTOM;horizalign,right;vertalign,bottom;);
		OnCommand=cmd();
		OffCommand=cmd(smooth,0.2;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(linear,0.15;diffusealpha,0;))(self);
				end;
			end;
    };
	--------------------- ARROW SELECTION -----------------------------
    LoadActor("_selectarrow") .. {
        InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X-255;y,SCREEN_CENTER_Y+190;zoomx,0.5;zoomy,0.5;diffusealpha,0);
		OnCommand=cmd(smooth,0.3;zoom,1;diffusealpha,1;);
		OffCommand=cmd(smooth,0.2;addx,-50;diffusealpha,0;);
		MenuLeftP1MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
		MenuLeftP2MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
    };
	LoadActor("_selectarrow") .. {
        InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X+255;y,SCREEN_CENTER_Y+190;zoomx,-0.5;zoomy,0.5;diffusealpha,0);
		OnCommand=cmd(smooth,0.3;zoomx,-1;zoomy,1;diffusealpha,1;);
		OffCommand=cmd(smooth,0.2;addx,50;diffusealpha,0;);
		MenuRightP1MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
		MenuRightP2MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
    };
};
--[[function LoadPlayerStuff(Player)
local t = {};
local pn = (Player == PLAYER_1) and 1 or 2;]]--

---------------------- PRESS START BUTTON ----------------------------------------
-- check if the player is actually even here! ---- for player 2 --
t[#t+1] = Def.ActorFrame {
	LoadActor("StartJoinSSS") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X+392;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(sleep,0.3;zoom,0;rotationz,-720;linear,0.35;rotationz,720;diffusealpha,1;zoom,1;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.25;zoomx,0.95;linear,0.25;zoomx,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;linear,0.25;zoomy,0;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(linear,0.15;zoomy,0;))(self);
				end;
			end;
	};
};	
-- check if the player is actually even here! ---- for player 1 --
t[#t+1] = Def.ActorFrame {
	LoadActor("StartJoinSSS") .. {
	    Condition=not GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X-392;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(sleep,0.3;zoom,0;rotationz,-720;linear,0.35;rotationz,720;diffusealpha,1;zoom,1;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.25;zoomx,0.95;linear,0.25;zoomx,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;linear,0.25;zoomy,0;diffusealpha,0);
		PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(linear,0.15;zoomy,0;))(self);
				end;
			end;
	};
};		
return t