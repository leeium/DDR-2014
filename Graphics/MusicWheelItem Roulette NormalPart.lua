local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("__Ext","roulette banner frame")) .. {
		InitCommand=cmd(scaletoclipped,220,220;);
	
	};
	LoadActor(THEME:GetPathG("__Ext","roulette banner frame")) .. {
		InitCommand=cmd(scaletoclipped,220,220;y,220;rotationx,180;croptop,0.5;diffusealpha,0.6;diffusetopedge,1,1,1,0);
	
	};
};
return t;
