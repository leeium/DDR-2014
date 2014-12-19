local t = ...;
t = Def.ActorFrame{
	Def.Sprite {
	Texture="ScreenPlayerOptions LineHighlight P1 1x2";
	
	Frame0000=0;
	Delay0000=0.5;
	
	Frame0001=1;
	Delay0001=0.5;
	InitCommand=cmd(addx,-262);
	};	
	LoadActor("Colour.png")..{
	InitCommand=cmd(addx,-360;addy,1;zoomy,0.98;zoomx,1.007);
	};
};	
return t;