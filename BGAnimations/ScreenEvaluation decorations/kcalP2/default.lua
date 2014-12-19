local t = Def.ActorFrame {};
--food equivalent meter
t[#t+1] = LoadActor("FE")..{
	InitCommand=cmd(addy,-10;addx,5);
};
t[#t+1] = LoadActor("Fill")..{
	InitCommand=cmd(addx,303;addy,166;vertalign,bottom);
	OnCommand=function(self)
	local CaloriesToday;
	CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetCaloriesBurnedToday();
	if CaloriesToday >= 0 and CaloriesToday <= 5 then
		local zoom = (CaloriesToday/5);
		self:zoomy(zoom);
	elseif CaloriesToday >= 5.01 and CaloriesToday <= 30 then
		local zoom = (CaloriesToday/30);
		self:zoomy(zoom);
	elseif CaloriesToday >= 30.01 and CaloriesToday <= 50 then
		local zoom = (CaloriesToday/50);
		self:zoomy(zoom);
	elseif CaloriesToday >= 50.01 and CaloriesToday <= 60 then
		local zoom = (CaloriesToday/60);
		self:zoomy(zoom);
	elseif CaloriesToday >= 60.01 and CaloriesToday <= 70 then
		local zoom = (CaloriesToday/70);
		self:zoomy(zoom);
	elseif CaloriesToday >= 70.01 and CaloriesToday <= 85 then
		local zoom = (CaloriesToday/85);
		self:zoomy(zoom);
	elseif CaloriesToday >= 85.01 and CaloriesToday <= 100 then
		local zoom = (CaloriesToday/100);
		self:zoomy(zoom);
	elseif CaloriesToday >= 100.01 and CaloriesToday <= 120 then
		local zoom = (CaloriesToday/120);
		self:zoomy(zoom);
	elseif CaloriesToday >= 120.01 and CaloriesToday <= 150 then
		local zoom = (CaloriesToday/150);
		self:zoomy(zoom);
	elseif CaloriesToday >= 150.01 and CaloriesToday <= 200 then
		local zoom = (CaloriesToday/200);
		self:zoomy(zoom);
	elseif CaloriesToday >= 200.01 and CaloriesToday <= 220 then
		local zoom = (CaloriesToday/220);
		self:zoomy(zoom);
	elseif CaloriesToday >= 220.01 and CaloriesToday <= 235 then
		local zoom = (CaloriesToday/235);
		self:zoomy(zoom);
	elseif CaloriesToday >= 235.01 and CaloriesToday <= 250 then
		local zoom = (CaloriesToday/250);
		self:zoomy(zoom);
	elseif CaloriesToday >= 250.01 and CaloriesToday <= 280 then
		local zoom = (CaloriesToday/280);
		self:zoomy(zoom);
	elseif CaloriesToday >= 280.01 and CaloriesToday <= 300 then
		local zoom = (CaloriesToday/300);
		self:zoomy(zoom);
	elseif CaloriesToday >= 300.01 and CaloriesToday <= 330 then
		local zoom = (CaloriesToday/330);
		self:zoomy(zoom);
	elseif CaloriesToday >= 330.01 and CaloriesToday <= 355 then
		local zoom = (CaloriesToday/355);
		self:zoomy(zoom);
	elseif CaloriesToday >= 355.01 and CaloriesToday <= 400 then
		local zoom = (CaloriesToday/400);
		self:zoomy(zoom);
	elseif CaloriesToday >= 400.01 and CaloriesToday <= 430 then
		local zoom = (CaloriesToday/430);
		self:zoomy(zoom);
	elseif CaloriesToday >= 430.01 and CaloriesToday <= 450 then
		local zoom = (CaloriesToday/450);
		self:zoomy(zoom);
	elseif CaloriesToday >= 450.01 and CaloriesToday <= 505 then
		local zoom = (CaloriesToday/505);
		self:zoomy(zoom);
	elseif CaloriesToday >= 505.01 and CaloriesToday <= 550 then
		local zoom = (CaloriesToday/550);
		self:zoomy(zoom);
	elseif CaloriesToday >= 550.01 and CaloriesToday <= 570 then
		local zoom = (CaloriesToday/570);
		self:zoomy(zoom);
	elseif CaloriesToday >= 570.01 and CaloriesToday <= 600 then
		local zoom = (CaloriesToday/600);
		self:zoomy(zoom);
	elseif CaloriesToday >= 600.01 and CaloriesToday <= 620 then
		local zoom = (CaloriesToday/620);
		self:zoomy(zoom);
	elseif CaloriesToday >= 620.01 and CaloriesToday <= 700 then
		local zoom = (CaloriesToday/700);
		self:zoomy(zoom);
	elseif CaloriesToday >= 700.01 and CaloriesToday <= 740 then
		local zoom = (CaloriesToday/740);
		self:zoomy(zoom);
	elseif CaloriesToday >= 740.01 and CaloriesToday <= 870 then
		local zoom = (CaloriesToday/870);
		self:zoomy(zoom);
	elseif CaloriesToday >= 870.01 and CaloriesToday <= 900 then
		local zoom = (CaloriesToday/900);
		self:zoomy(zoom);			
	end;
	end;
};
--Percent
t[#t+1] = LoadFont("_itc avant garde std bk 50px")..{
	InitCommand=cmd(horizalign,right;addx,220-4;addy,95;zoom,1.5;diffuse,color("#000000"));
	OnCommand=function(self)
	local CaloriesToday;
	CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetCaloriesBurnedToday();
	if CaloriesToday >= 0 and CaloriesToday <= 5 then
		local percent = ((CaloriesToday/5)*100);
		self:settextf("%0.0f",percent)	
	elseif CaloriesToday >= 5.01 and CaloriesToday <= 30 then
		local percent = ((CaloriesToday/30)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 30.01 and CaloriesToday <= 50 then
		local percent = ((CaloriesToday/50)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 50.01 and CaloriesToday <= 60 then
		local percent = ((CaloriesToday/60)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 60.01 and CaloriesToday <= 70 then
		local percent = ((CaloriesToday/70)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 70.01 and CaloriesToday <= 85 then
		local percent = ((CaloriesToday/85)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 85.01 and CaloriesToday <= 100 then
		local percent = ((CaloriesToday/100)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 100.01 and CaloriesToday <= 120 then
		local percent = ((CaloriesToday/120)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 120.01 and CaloriesToday <= 150 then
		local percent = ((CaloriesToday/150)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 150.01 and CaloriesToday <= 200 then
		local percent = ((CaloriesToday/200)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 200.01 and CaloriesToday <= 220 then
		local percent = ((CaloriesToday/220)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 220.01 and CaloriesToday <= 235 then
		local percent = ((CaloriesToday/235)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 235.01 and CaloriesToday <= 250 then
		local percent = ((CaloriesToday/250)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 250.01 and CaloriesToday <= 280 then
		local percent = ((CaloriesToday/280)*100);
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 280.01 and CaloriesToday <= 300 then
		local percent = ((CaloriesToday/300)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 300.01 and CaloriesToday <= 330 then
		local percent = ((CaloriesToday/330)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 330.01 and CaloriesToday <= 355 then
		local percent = ((CaloriesToday/355)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 355.01 and CaloriesToday <= 400 then
		local percent = ((CaloriesToday/400)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 400.01 and CaloriesToday <= 430 then
		local percent = ((CaloriesToday/430)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 430.01 and CaloriesToday <= 450 then
		local percent = ((CaloriesToday/450)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 450.01 and CaloriesToday <= 505 then
		local percent = ((CaloriesToday/505)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 505.01 and CaloriesToday <= 550 then
		local percent = ((CaloriesToday/550)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 550.01 and CaloriesToday <= 570 then
		local percent = ((CaloriesToday/570)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 570.01 and CaloriesToday <= 600 then
		local percent = ((CaloriesToday/600)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 600.01 and CaloriesToday <= 620 then
		local percent = ((CaloriesToday/620)*100);	
		self:settextf("%0.0f",percent)	
	elseif CaloriesToday >= 620.01 and CaloriesToday <= 700 then
		local percent = ((CaloriesToday/700)*100);	
		self:settextf("%0.0f",percent)	
	elseif CaloriesToday >= 700.01 and CaloriesToday <= 740 then
		local percent = ((CaloriesToday/740)*100);	
		self:settextf("%0.0f",percent)	
	elseif CaloriesToday >= 740.01 and CaloriesToday <= 870 then
		local percent = ((CaloriesToday/870)*100);	
		self:settextf("%0.0f",percent)
	elseif CaloriesToday >= 870.01 and CaloriesToday <= 900 then
		local percent = ((CaloriesToday/900)*100);	
		self:settextf("%0.0f",percent)			
	end;
	end;
	};
t[#t+1] = LoadFont("_itc avant garde std bk 50px")..{
	InitCommand=cmd(addx,255-4;addy,95;zoom,1.5;diffuse,color("#000000");settext,"%");
	};
--pictures
t[#t+1] = Def.Sprite{
		InitCommand=cmd(zoom,1);
		OnCommand=function(self)
		local CaloriesToday;
		CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetCaloriesBurnedToday();
		if CaloriesToday >= 0 and CaloriesToday <= 5 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/005.png"));
		elseif CaloriesToday >= 5.01 and CaloriesToday <= 30 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/030.png"));
		elseif CaloriesToday >= 30.01 and CaloriesToday <= 50 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/050.png"));
		elseif CaloriesToday >= 50.01 and CaloriesToday <= 60 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/060.png"));
		elseif CaloriesToday >= 60.01 and CaloriesToday <= 70 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/070.png"));
		elseif CaloriesToday >= 70.01 and CaloriesToday <= 85 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/085.png"));
		elseif CaloriesToday >= 85.01 and CaloriesToday <= 100 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/100.png"));
		elseif CaloriesToday >= 100.01 and CaloriesToday <= 120 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/120.png"));
		elseif CaloriesToday >= 120.01 and CaloriesToday <= 150 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/150.png"));
		elseif CaloriesToday >= 150.01 and CaloriesToday <= 200 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/200.png"));
		elseif CaloriesToday >= 200.01 and CaloriesToday <= 220 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/220.png"));
		elseif CaloriesToday >= 220.01 and CaloriesToday <= 235 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/235.png"));
		elseif CaloriesToday >= 235.01 and CaloriesToday <= 250 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/250.png"));
		elseif CaloriesToday >= 250.01 and CaloriesToday <= 280 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/280.png"));
		elseif CaloriesToday >= 280.01 and CaloriesToday <= 300 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/300.png"));
		elseif CaloriesToday >= 300.01 and CaloriesToday <= 330 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/330.png"));
		elseif CaloriesToday >= 330.01 and CaloriesToday <= 355 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/355.png"));
		elseif CaloriesToday >= 355.01 and CaloriesToday <= 400 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/400.png"));
		elseif CaloriesToday >= 400.01 and CaloriesToday <= 430 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/430.png"));
		elseif CaloriesToday >= 430.01 and CaloriesToday <= 450 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/450.png"));
		elseif CaloriesToday >= 450.01 and CaloriesToday <= 505 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/505.png"));
		elseif CaloriesToday >= 505.01 and CaloriesToday <= 550 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/550.png"));
		elseif CaloriesToday >= 550.01 and CaloriesToday <= 570 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/570.png"));
		elseif CaloriesToday >= 570.01 and CaloriesToday <= 600 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/600.png"));
		elseif CaloriesToday >= 600.01 and CaloriesToday <= 620 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/620.png"));
		elseif CaloriesToday >= 620.01 and CaloriesToday <= 700 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/700.png"));
		elseif CaloriesToday >= 700.01 and CaloriesToday <= 740 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/740.png"));
		elseif CaloriesToday >= 740.01 and CaloriesToday <= 870 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/870.png"));
		elseif CaloriesToday >= 870.01 and CaloriesToday <= 900 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcalP1/900.png"));			
		end;
		end;
		};
return t;
