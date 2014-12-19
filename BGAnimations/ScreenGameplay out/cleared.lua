local t = Def.ActorFrame{};
--------CLEARED-----------
	-- C
t[#t+1] = LoadActor("C01.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;linear,0.05;x,-379;diffusealpha,0.85;sleep,4.0);
	};
	-- L
t[#t+1] = LoadActor("C02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.05;linear,0.05;x,-259;diffusealpha,0.85;sleep,3.95);
	};
	-- E
t[#t+1] = LoadActor("C03.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.10;linear,0.05;x,-142;diffusealpha,0.85;sleep,3.90);
	};
	-- A
t[#t+1] = LoadActor("C04.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.15;linear,0.05;x,-12;diffusealpha,0.85;sleep,3.85);
	};
	-- R
t[#t+1] = LoadActor("C05.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.20;linear,0.05;x,125;diffusealpha,0.85;sleep,3.80);
	};
	-- E
t[#t+1] = LoadActor("C06.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.25;linear,0.05;x,250;diffusealpha,0.85;sleep,3.75);
	};
	-- D
t[#t+1] = LoadActor("C07.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;diffusealpha,0;sleep,0.30;linear,0.05;x,378;diffusealpha,0.85;sleep,3.70);
	};	
	------CLEAREDBLINK----------------
t[#t+1] = LoadActor("C01.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;linear,0.05;x,-379;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("C02.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.05;linear,0.05;x,-259;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("C03.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.10;linear,0.05;x,-142;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("C04.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.15;linear,0.05;x,-12;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("C05.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.20;linear,0.05;x,125;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};	
t[#t+1] = LoadActor("C06.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.25;linear,0.05;x,250;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
t[#t+1] = LoadActor("C07.png")..{
		InitCommand=cmd(diffusealpha,0;x,0;y,0;zoom,1);
		OnCommand=cmd(sleep,2;blend,'BlendMode_Add';diffusealpha,0;sleep,0.30;linear,0.05;x,378;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};

return t;