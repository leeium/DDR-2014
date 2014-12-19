local t = Def.ActorFrame {};

--CaloriesP2--
--Title
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177;horizalign,right;addx,-35);
	OnCommand=function(self)
		self:settextf("Calories from this song:");
	end;
};
--Numbers
t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177;horizalign,right;addx,35);
			OnCommand=function(self)
				local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
				local CaloriesBurnedP2 = pssp2:GetCaloriesBurned();
				self:settextf("%04.2f",CaloriesBurnedP2)	
			end;
		};
--kcal
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177;horizalign,left;addx,40);
	OnCommand=function(self)
		self:settextf("kcal");
	end;
};
--Total CaloriesP1
--Title
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177+30;horizalign,right;addx,-35;diffuse,color("#000000"));
	OnCommand=function(self)
		self:settextf("Calories today:");
	end;
};
--Numbers
t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177+30;horizalign,right;addx,35;diffuse,color("#000000"));
			OnCommand=function(self)
					local CaloriesToday;
					local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
					local CaloriesBurnedP2 = pssp2:GetCaloriesBurned();
					CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetCaloriesBurnedToday();
					self:visible(true);
					self:settextf("%04.2f",CaloriesToday)	
		end;
		};
--kcal
t[#t+1] = LoadFont("Common Normal")..{
	InitCommand=cmd(player,PLAYER_2;zoom,0.7;draworder,6;y,SCREEN_CENTER_Y-177+30;horizalign,left;addx,40;diffuse,color("#000000"));
	OnCommand=function(self)
		self:settextf("kcal");
	end;
};
return t;
