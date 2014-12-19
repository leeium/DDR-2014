local t = Def.ActorFrame {};

t[#t+1] = LoadActor("PaneRadar")..{
	InitCommand=cmd(x,SCREEN_LEFT+175;y,SCREEN_CENTER_Y-118+12;player,PLAYER_1;zoom,0.9);
	OffCommand=cmd(linear,0.25;addx,-500);
};
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP1_Pane", "GrooveRadarP1_Pane" );
t[#t+1] = StandardDecorationFromFileOptional("PaneDisplayTextP1","PaneDisplayTextP1");
return t;
