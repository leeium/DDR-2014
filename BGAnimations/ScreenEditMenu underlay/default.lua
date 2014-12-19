return Def.ActorFrame {
	LoadActor("ScreenEditMenu_page") .. {
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
};
