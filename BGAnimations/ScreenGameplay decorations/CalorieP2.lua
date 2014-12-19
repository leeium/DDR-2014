local t = Def.ActorFrame{};

-- Kcal Text
t[#t+1] = LoadFont("_Bolster","21px") .. {
	InitCommand=cmd(x,WideScale(31,38.5);y,8;zoomx,WideScale(0.68,0.85);zoomy,0.68;settext,"kcal";horizalign,left;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_2));
};

-- Mini Calorie P2
t[#t+1] = Def.RollingNumbers {
	Name="MiniCalorieP2";
	File=THEME:GetPathF("_Bolster","21px");
	InitCommand=cmd(x,WideScale(-18,-23.5);y,8;Load,"RollingNumbersCalorieMini";targetnumber,"1000";zoomx,WideScale(0.68,0.85);zoomy,0.68;horizalign,left;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_2));
};

-- Black cover P2
t[#t+1] = Def.Quad {
	InitCommand=cmd(x,WideScale(-12,-16.5);y,2;zoomto,14,14;diffuse,color("#000000"));
};

-- Dot P2
t[#t+1] = LoadFont("_Bolster 21px") .. {
	InitCommand=cmd(x,WideScale(-6,-8.5);y,8;zoomx,WideScale(0.8,1);zoomy,0.8;settext,".";horizalign,right;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_2));
};

-- Calorie P2
t[#t+1] = Def.RollingNumbers {
	Name="CalorieP2";
	File=THEME:GetPathF("_Bolster","21px");
	InitCommand=cmd(x,WideScale(-9,-12.5);y,8;Load,"RollingNumbersCalorie";zoomx,WideScale(0.8,1);zoomy,0.8;horizalign,right;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_2));
};

local function Update(self)
	local CalorieP2 = self:GetChild("CalorieP2");
	local MiniCalorieP2 = self:GetChild("MiniCalorieP2");
	local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
	local CaloriesBurnedP2 = pssp2:GetCaloriesBurned();
	-- RollingNumbersの自動四捨五入対策
	if CaloriesBurnedP2 - 0.5 < 0 then
		CalorieP2:targetnumber(0);
	else
		CalorieP2:targetnumber(CaloriesBurnedP2-0.5);
	end;
	MiniCalorieP2:targetnumber((CaloriesBurnedP2*1000)%1000+1000);
end;

t.InitCommand=cmd(SetUpdateFunction,Update);
	
return t