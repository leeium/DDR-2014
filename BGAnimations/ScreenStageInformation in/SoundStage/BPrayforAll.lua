local t = Def.ActorFrame{};
--[[---------- BACKGROUND HELP 
t[#t+1] = LoadActor("prayforall.png")..{
		InitCommand=cmd(x,0;y,0;zoom,1);
		OnCommand=cmd();
	}; ]]--
--------CLEARED-----------
	-- P
t[#t+1] = LoadActor("P01.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;linear,0.05;x,-420;diffusealpha,1;sleep,4.0);
	};
	-- R
t[#t+1] = LoadActor("P02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.05;linear,0.05;x,-325;diffusealpha,1;sleep,3.95);
	};
	-- A
t[#t+1] = LoadActor("P03.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.10;linear,0.05;x,-245;diffusealpha,1;sleep,3.90);
	};
	-- Y
t[#t+1] = LoadActor("P04.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.15;linear,0.05;x,-145;diffusealpha,1;sleep,3.85);
	};
	-- F
t[#t+1] = LoadActor("P05.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.20;linear,0.05;x,-5;diffusealpha,1;sleep,3.80);
	};
	-- O
t[#t+1] = LoadActor("P06.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.25;linear,0.05;x,75;diffusealpha,1;sleep,3.75);
	};
	-- R
t[#t+1] = LoadActor("P02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.30;linear,0.05;x,160;diffusealpha,1;sleep,3.70);
	--A	
	};
t[#t+1] = LoadActor("P08.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.30;linear,0.05;x,320;diffusealpha,1;sleep,3.70);
	--L	
	};	
t[#t+1] = LoadActor("P09.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.30;linear,0.05;x,420;diffusealpha,1;sleep,3.70);
	--L	
	};	
t[#t+1] = LoadActor("P09.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.30;linear,0.05;x,465;diffusealpha,1;sleep,3.70);
	};		
	------PRAYFORALL BLINK----------------
t[#t+1] = LoadActor("P01.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;linear,0.05;x,-420;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.05;linear,0.05;x,-325;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P03.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.10;linear,0.05;x,-245;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P04.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.15;linear,0.05;x,-145;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P05.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.20;linear,0.05;x,-5;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};	
t[#t+1] = LoadActor("P06.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.25;linear,0.05;x,75;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.30;linear,0.05;x,160;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P08.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.35;linear,0.05;x,320;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};	
t[#t+1] = LoadActor("P09.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.40;linear,0.05;x,420;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("P09.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.45;linear,0.05;x,465;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};	
	
return t;