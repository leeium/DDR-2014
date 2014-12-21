return Def.ActorFrame{

	--Background Colored 1p vs2p ------------------------------------------
	LoadActor( "Background_ddr2013.png" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(playcommand,"Animate");
		AnimateCommand=cmd(rotationz,0;linear,60;rotationz,360;queuecommand,"Animate");

	};
	-- BACKGROUND ROTATION EFFECTS ---------------------------------------------------
	LoadActor( "BackgroundEffect_ddr2013.png" )..{
		InitCommand=cmd(zoom,0.9;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0.5);
		OnCommand=cmd(spin;effectmagnitude,0,0,10);
	};
	LoadActor( "BackgroundEffect_ddr2013.png" )..{
		InitCommand=cmd(blend,'BlendMode_Add';zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0.75);
		--SPIN;effectmagnitude,x,y,z
		OnCommand=cmd(spin;effectmagnitude,0,0,15);
	};
	LoadActor( "BackgroundEffect_ddr2013.png" )..{
		InitCommand=cmd(rotationz,90;zoom,1.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0.25);
		OnCommand=cmd(spin;effectmagnitude,0,0,-5);
	
	};	
	--LOGO---------------------------------------------------
	LoadActor( "DDR2013_logo" )..{
	    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,2;),
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.6;zoom,1;diffusealpha,1;sleep,1);
	};

	LoadActor( "DDR2013_logo" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;),
		OnCommand=cmd(diffusealpha,0;playcommand,"Animate");
		AnimateCommand=cmd(sleep,1.5;linear,0.5;zoom,1;blend,'BlendMode_Add';diffusealpha,0.8;decelerate,2.7;zoom,2;diffusealpha,0;sleep,10;queuecommand,"Animate");
		
	};
	
	LoadActor( "DDR2013_Blend.png" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.6;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;accelerate,0.8;zoom,1;diffusealpha,0.6;
		decelerate,0.8;zoom,1;diffusealpha,0;sleep,0.5;queuecommand,"Animate");
		
	};
-- Soustitre 
	LoadActor( "konami_copyright" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.916;linear,0.4);
	};
	-- eamusement titre --
    LoadActor( "eam2.png" )..{
		InitCommand=function(self)
		if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
			self:visible(false);
		else
			self:visible(true);
			self:Center();
		end;
		end;
		OnCommand=cmd(diffusealpha,1);
	
	};
	LoadActor( "eam2.png" )..{
		InitCommand=function(self)
		if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
			self:visible(false);
		else
			self:visible(true);
			self:Center();
		end;
		end;
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,1;glowshift;effectperiod,0.6);
	
	};
	-- DOUBLE PREMIUM
	LoadActor("DOUBLE PREMIUM") .. {
	--	InitCommand=cmd(zoom,1.1;y,SCREEN_CENTER_Y-205;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.9,0.9,0.9,1;effectperiod,0.33);
		InitCommand=cmd(zoom,1.8;y,SCREEN_CENTER_Y-310;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.9,0.9,0.9,1;effectperiod,0.33);
		OnCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" then
			--	self:x(SCREEN_RIGHT-138)
				self:x(SCREEN_RIGHT-130)
			elseif GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" then
			--	self:x(SCREEN_RIGHT-84)
				self:x(SCREEN_RIGHT-130)
			else
				self:visible(false)
			end
		end;
	};
	-- JOINT PREMIUM
	LoadActor("JOINT PREMIUM") .. {
	--	InitCommand=cmd(zoom,1.1;x,SCREEN_RIGHT-84;y,SCREEN_CENTER_Y-205;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.9,0.9,0.9,1;effectperiod,0.33);
		InitCommand=cmd(zoom,1.8;x,SCREEN_RIGHT-130;y,SCREEN_CENTER_Y-230;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.9,0.9,0.9,1;effectperiod,0.33);
		Condition = GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit";
	};
Def.BitmapText{
Font="Common normal",
Text=themeInfo["Name"] .. " version " .. themeInfo["Version"] .. " by " .. themeInfo["Author"] ,
InitCommand=cmd(horizalign,left; xy,10,20; shadowlength,1; zoom, 0.85)
};

};