local t = Def.ActorFrame{};

-- Kcal Text
t[#t+1] = LoadFont("_Bolster","21px") .. {
	InitCommand=cmd(x,WideScale(31,38.5);y,8;zoomx,WideScale(0.68,0.85);zoomy,0.68;settext,"kcal";horizalign,left;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_1));
};

-- Mini Calorie P1
t[#t+1] = Def.RollingNumbers {
	Name="MiniCalorieP1";
	File=THEME:GetPathF("_Bolster","21px");
	InitCommand=cmd(x,WideScale(-18,-23.5);y,8;Load,"RollingNumbersCalorieMini";targetnumber,"1000";zoomx,WideScale(0.68,0.85);zoomy,0.68;horizalign,left;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_1));
};

-- Black cover P1
t[#t+1] = Def.Quad {
	InitCommand=cmd(x,WideScale(-12,-16.5);y,2;zoomto,14,14;diffuse,color("#000000"));
};

-- Dot P1
t[#t+1] = LoadFont("_Bolster 21px") .. {
	InitCommand=cmd(x,WideScale(-6,-8.5);y,8;zoomx,WideScale(0.8,1);zoomy,0.8;settext,".";horizalign,right;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_1));
};

-- Calorie P1
t[#t+1] = Def.RollingNumbers {
	Name="CalorieP1";
	File=THEME:GetPathF("_Bolster","21px");
	InitCommand=cmd(x,WideScale(-9,-12.5);y,8;Load,"RollingNumbersCalorie";zoomx,WideScale(0.8,1);zoomy,0.8;horizalign,right;vertalign,bottom;diffuse,PlayerScoreColor(PLAYER_1));
};

local function Update(self)
	local CalorieP1 = self:GetChild("CalorieP1");
	local MiniCalorieP1 = self:GetChild("MiniCalorieP1");
	local pssp1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
	local CaloriesBurnedP1 = pssp1:GetCaloriesBurned();
	-- RollingNumbersの自動四捨五入対策
	if CaloriesBurnedP1 - 0.5 < 0 then
		CalorieP1:targetnumber(0);
	else
		CalorieP1:targetnumber(CaloriesBurnedP1-0.5);
	end;
	MiniCalorieP1:targetnumber((CaloriesBurnedP1*1000)%1000+1000);
end;

t.InitCommand=cmd(SetUpdateFunction,Update);
	
return t