return Def.Sprite {
	InitCommand=function(self)
		local pm = GAMESTATE:GetPlayMode()
		if pm == "PlayMode_Rave" then
			self:Load(THEME:GetPathG("ScreenGameplay","StageFrame/StageFrame"));
		elseif pm == "PlayMode_Oni" or pm == "PlayMode_Nonstop" or pm == "PlayMode_Endless" then
			self:Load(THEME:GetPathG("ScreenGameplay","StageFrame/Course"));
		elseif GAMESTATE:IsExtraStage() then
			self:Load(THEME:GetPathG("ScreenGameplay","StageFrame/StageFrame"));
		elseif GAMESTATE:IsExtraStage2() then
			self:Load(THEME:GetPathG("ScreenGameplay","StageFrame/StageFrame"));
		else
			self:Load(THEME:GetPathG("ScreenGameplay","StageFrame/StageFrame"));
		end;
		
	end;						
};