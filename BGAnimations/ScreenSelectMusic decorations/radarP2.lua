local t = Def.ActorFrame{

LoadActor("PaneRadar")..{
	InitCommand=cmd(x,SCREEN_RIGHT-175-120;y,SCREEN_CENTER_Y-118+12;player,PLAYER_2;zoom,0.9);
	OffCommand=cmd(linear,0.25;addx,500);
};
StandardDecorationFromFileOptional( "GrooveRadarP2_Pane", "GrooveRadarP2_Pane" );
StandardDecorationFromFileOptional("PaneDisplayTextP2","PaneDisplayTextP2");
};
return t;
