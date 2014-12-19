local t = Def.ActorFrame{};
	-- FAILED --
	-- F
t[#t+1] = LoadActor("F01.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;linear,0.05;x,-294;diffusealpha,1;sleep,4.0;accelerate,0.2;diffusealpha,0;addy,30);
	};
	-- A
t[#t+1] = LoadActor("F02.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;sleep,0.05;linear,0.05;x,-151;diffusealpha,1;sleep,3.95;accelerate,0.2;diffusealpha,0;addy,30);
	};
	-- I
t[#t+1] = LoadActor("F03.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;sleep,0.10;linear,0.05;x,-44;diffusealpha,1;sleep,3.90;accelerate,0.2;diffusealpha,0;addy,30);
	};
	-- L
t[#t+1] = LoadActor("F04.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;sleep,0.15;linear,0.05;x,44;diffusealpha,1;sleep,3.85;accelerate,0.2;diffusealpha,0;addy,30);
	};
	-- E
t[#t+1] = LoadActor("F05.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;sleep,0.20;linear,0.05;x,169;diffusealpha,1;sleep,3.80;accelerate,0.2;diffusealpha,0;addy,30);
	};
	-- D
t[#t+1] = LoadActor("F06.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.05;x,298;diffusealpha,1;sleep,3.75;accelerate,0.2;diffusealpha,0;addy,30);
	};

    -- FAILED BLINK --
	--F
t[#t+1] = LoadActor("F01.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;linear,0.05;x,-294;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
	--A
t[#t+1] = LoadActor("F02.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.05;linear,0.05;x,-151;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
	--I
t[#t+1] = LoadActor("F03.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.10;linear,0.05;x,-44;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
	--L
t[#t+1] = LoadActor("F04.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.15;linear,0.05;x,44;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};
	--E
t[#t+1] = LoadActor("F05.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.20;linear,0.05;x,169;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};	
	--D
t[#t+1] = LoadActor("F06.png")..{
		InitCommand=cmd(x,0;y,6;zoom,0.71);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.25;linear,0.05;x,298;diffusealpha,0;sleep,0.2;linear,0.01;diffusealpha,1;linear,0.1;diffusealpha,0);
	};

return t;