local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
    LoadActor("Character") .. {
	    InitCommand=cmd(diffusealpha,0;x,50;y,410;zoom,2;rotationz,180;rotationy,180;fadetop,0.5;croptop,0.5);		
		OnCommand=cmd(zoomy,0;sleep,0.6;linear,0.1;diffusealpha,0.1;zoomy,1.9;linear,0.1;zoomy,2;zoomx,2.2;linear,0.1;zoomx,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
	};
};	
t[#t+1] = Def.ActorFrame {
    LoadActor("Pad") .. {
	    InitCommand=cmd(diffusealpha,0;x,0;y,240);
		OnCommand=cmd(sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,2;linear,0.1;zoom,1.3;linear,0.2;zoom,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);		
	}; 
	LoadActor("Pad") .. {
	    InitCommand=cmd(diffusealpha,0;x,0;y,240);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,0.5;linear,0.1;diffusealpha,0;zoom,2;linear,0.1;zoom,1.3;linear,0.2;zoom,2);
		GainFocusCommand=cmd(stoptweening;zoom,1.98;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.5;diffusealpha,0.5;linear,0.5;diffusealpha,0;queuecommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;zoom,0);
		OffCommand=cmd(stoptweening;smooth,0.1;zoom,0;diffusealpha,0;);		
	};    
};
t[#t+1] = Def.ActorFrame {
    LoadActor("Info") .. {
        Condition=GAMESTATE:GetNumPlayersEnabled()==1;
		InitCommand=cmd(diffusealpha,0;x,370;y,-150;zoom,2);
	    OnCommand=cmd(linear,0.3;zoomy,2;diffusealpha,0);
		GainFocusCommand=cmd(stoptweening;zoomy,0;sleep,0.1;linear,0.2;zoomy,2;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoomy,0);
		OffCommand=cmd(linear,0.3;zoom,0;diffusealpha,0;);
	};
    LoadActor("Info") .. {
        Condition=GAMESTATE:GetNumPlayersEnabled()==2;
		InitCommand=cmd(diffusealpha,0;x,370;y,-150;zoom,2);
	    OnCommand=cmd(linear,0.3;zoomy,2;diffusealpha,0);
		GainFocusCommand=cmd(stoptweening;zoomy,0;sleep,0.1;linear,0.2;zoomy,2;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoomy,0);
		OffCommand=cmd(linear,0.3;zoom,0;diffusealpha,0;);
	};
};	
t[#t+1] = Def.ActorFrame {
	LoadActor("Title") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==1;
	    InitCommand=cmd(diffusealpha,0;x,420;y,-305;zoom,2);
		OnCommand=cmd(linear,0.3;diffusealpha,1;zoomy,2;playcommand,"Animate");
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoomy,0);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoomy,2;diffusealpha,1;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;smooth,0.3;zoom,0;diffusealpha,0;);
	};
	LoadActor("Title") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==2;
	    InitCommand=cmd(diffusealpha,0;x,420;y,-305;zoom,2);
		OnCommand=cmd(linear,0.3;diffusealpha,1;zoomy,2;playcommand,"Animate");
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoomy,0);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoomy,2;diffusealpha,1;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;smooth,0.3;zoom,0;diffusealpha,0;);
	};
};
t[#t+1] = Def.ActorFrame {
    LoadActor("Character") .. {
	    InitCommand=cmd(diffusealpha,0;x,20;y,-110;zoom,2);		
		OnCommand=cmd(zoomy,0;sleep,0.6;linear,0.1;diffusealpha,1;zoomy,1.9;linear,0.1;zoomy,2;zoomx,2;linear,0.1;zoomx,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
	};
};	

return t;