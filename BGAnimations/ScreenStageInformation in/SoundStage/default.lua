local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};
if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

local t = Def.ActorFrame{};
--------- SOUND STAGE ---------------
	-- 1st stage ------
t[#t+1] = LoadActor("1st_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_1st';
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
	-- 2nd stage -------
t[#t+1] = LoadActor("2nd_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_2nd';
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
	-- 3
t[#t+1] = LoadActor("3rd_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_3rd' and PREFSMAN:GetPreference("SongsPerPlay") == 5 ;
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
t[#t+1] = LoadActor("3rd_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_3rd' and PREFSMAN:GetPreference("SongsPerPlay") == 4 ;
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
	-- 4
t[#t+1] = LoadActor("4th_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_4th';
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
	-- 5
t[#t+1] = LoadActor("Other_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_5th';
		StartTransitioningCommand=function(self)
		self:play();
	end;
};	
    -- 6
t[#t+1] = LoadActor("Other_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_6th';
		StartTransitioningCommand=function(self)
		self:play();
	end;
};
t[#t+1] = LoadActor("Final_stage")..{
        Condition=GAMESTATE:GetCurrentStage() == 'Stage_Final';
	--	Condition=PREFSMAN:GetPreference("SongsPerPlay");
		StartTransitioningCommand=function(self)
		self:play();
	end;
};
--extra stage
t[#t+1] = LoadActor("Extra_stage")..{
        Condition=GAMESTATE:IsExtraStage();
		StartTransitioningCommand=function(self)
		self:play();
	end;
};
-- encore extra stage
t[#t+1] = LoadActor("Encore_Extra_stage")..{
        Condition=GAMESTATE:IsExtraStage2();
		StartTransitioningCommand=function(self)
		self:play();
	end;
};		
----- event mode --
t[#t+1] = LoadActor("Other_stage")..{
        Condition=GAMESTATE:IsEventMode();  
		StartTransitioningCommand=function(self)
		self:play();
	end;
};
	
return t;