return Def.ActorFrame {
	--p1
	LoadActor( "Back" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-243-164+50;y,SCREEN_CENTER_Y);
		OnCommand=cmd(addx,-400;linear,0.15;addx,400);
		OffCommand=cmd(linear,0.15;addx,-400);
	};
	LoadActor( "Explanation" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-243-164+50-3;y,SCREEN_BOTTOM-100-80+50);
		OnCommand=cmd(addx,-400;linear,0.15;addx,400);
		OffCommand=cmd(linear,0.15;addx,-400);
	};
	--p2
	LoadActor( "Back" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);rotationy,180;x,SCREEN_CENTER_X+243+164-50;y,SCREEN_CENTER_Y);
		OnCommand=cmd(addx,400;linear,0.15;addx,-400);
		OffCommand=cmd(linear,0.15;addx,400);
	};
	LoadActor( "Explanation" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+243+164-50+3;y,SCREEN_BOTTOM-100-80+50);
		OnCommand=cmd(addx,400;linear,0.15;addx,-400);
		OffCommand=cmd(linear,0.15;addx,400);
	};
	--p1
	LoadActor( "OptionsLabels" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-310-220+166-164+50;y,SCREEN_CENTER_Y-50;draworder,1);
		OnCommand=cmd(addx,-400;linear,0.15;addx,400);
		OffCommand=cmd(linear,0.15;addx,-400);
	};
	--p1
	LoadActor( "OptionsPage" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-310+164-164+50-2;y,SCREEN_CENTER_Y-50);
		OnCommand=cmd(addx,-400;linear,0.15;addx,400);
		OffCommand=cmd(linear,0.15;addx,-400);
	};
	--p2
	LoadActor( "OptionsLabels" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+310+220-166+164-50-210-30+5;y,SCREEN_CENTER_Y-50;draworder,1);
		OnCommand=cmd(addx,400;linear,0.15;addx,-400);
		OffCommand=cmd(linear,0.15;addx,400);
	};
	--p2
	LoadActor( "OptionsPage" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+310-164+164-50+210-20+10-2;y,SCREEN_CENTER_Y-50);
		OnCommand=cmd(addx,400;linear,0.15;addx,-400);
		OffCommand=cmd(linear,0.15;addx,400);
	};
}