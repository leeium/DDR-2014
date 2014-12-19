local player = Var "Player"

local t = Def.ActorFrame{

--[[
	Def.Quad{
		BeginCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local screen = SCREENMAN:GetTopScreen();
				local glifemeter = screen:GetLifeMeter(player);
			--	local test = glifemeter:ChangeLives(10);
				local pm = GAMESTATE:GetPlayMode()
				if pm == "PlayMode_Oni" then
					glifemeter:ChangeLives(7)
				end;
			end;
		end;
	};
--]]

	-- Battery 1 line
	LoadActor("Danger")..{
		InitCommand=function(self)
			self:texcoordvelocity(1.5,0)
			self:x(17)
			self:zoom(1)
		end;
	};
	-- Battery 2-7 line
	LoadActor("Us")..{
		InitCommand=function(self)
			self:texcoordvelocity(0.8,0)
			self:zoom(1)
			self:x(17)
			self:visible(false)
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player == player then
				if params.LivesLeft >= 2 then
					self:visible(true)
				else
					self:visible(false)
				end
			end
		end;
	};
	-- Battery full line
	LoadActor("Full")..{
		InitCommand=function(self)
			self:texcoordvelocity(0.8,0)
			self:zoom(1)
			self:x(17)
		end;
		BeginCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() == 1 then
				self:visible(false)
			else
				self:visible(true)
			end
		end;
		LifeChangedMessageCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if params.Player == player then
				if glifemeter:GetTotalLives() == 1 then
					self:visible(false)
				elseif params.LivesLeft == glifemeter:GetTotalLives() then
					self:visible(true)
				else
					self:visible(false)
				end
			end
		end;
	};
	-- 8 Battery empty red
	Def.Quad{
		InitCommand=cmd(horizalign,right;x,244;diffusetopedge,color("#5d1115");diffusebottomedge,color("#f50d0d"));
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() >= 5 then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			self:finishtweening();
			self:linear(0);
			self:diffusetopedge(color("#5d1115"));
			self:diffusebottomedge(color("#f50d0d"));
			self:zoomto(454-(params.LivesLeft*56.75),26);
			self:linear(0.33);
			self:diffusetopedge(color("#707171"));
			self:diffusebottomedge(color("#404040"));
		end;	
	};
	-- 8 Battery empty over
	Def.Quad{
		InitCommand=cmd(horizalign,right;x,244;diffusetopedge,color("#707171");diffusebottomedge,color("#404040"));
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() >= 5 then
				self:visible(true)
				if glifemeter:GetTotalLives() >= 8 then
					self:zoomto(0,26);
				elseif glifemeter:GetTotalLives() == 7 then
					self:zoomto(56.75,26);
				elseif glifemeter:GetTotalLives() == 6 then
					self:zoomto(113.5,26);
				elseif glifemeter:GetTotalLives() == 5 then
					self:zoomto(170.5,26);
				end
			else
				self:visible(false)
			end
		end;	
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			self:finishtweening();
			self:sleep(0.33);
			self:zoomto(454-(params.LivesLeft*56.75),26);
		end;
	};
	-- 4 Battery empty red
	Def.Quad{
		InitCommand=cmd(horizalign,right;x,244;diffusetopedge,color("#5d1115");diffusebottomedge,color("#f50d0d"));
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() <= 4 then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			self:finishtweening();
			self:linear(0);
			self:diffusetopedge(color("#5d1115"));
			self:diffusebottomedge(color("#f50d0d"));
			self:zoomto(454-(params.LivesLeft*113.5),26);
			self:linear(0.33);
			self:diffusetopedge(color("#707171"));
			self:diffusebottomedge(color("#404040"));
		end;	
	};
	-- 4 Battery empty over
	Def.Quad{
		InitCommand=cmd(horizalign,right;x,244;diffusetopedge,color("#707171");diffusebottomedge,color("#404040"));
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() <= 4 then
				self:visible(true)
				if glifemeter:GetTotalLives() == 4 then
					self:zoomto(0,26);
				elseif glifemeter:GetTotalLives() == 3 then
					self:zoomto(113.5,26);
				elseif glifemeter:GetTotalLives() == 2 then
					self:zoomto(227,26);
				elseif glifemeter:GetTotalLives() == 1 then
					self:zoomto(340.5,26);
				end
			else
				self:visible(false)
			end
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			self:finishtweening();
			self:sleep(0.33);
			self:zoomto(454-(params.LivesLeft*113.5),26);
		end;
	};
	
	
	Def.Sprite {
		BeginCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			
			self:x(10);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				if glifemeter:GetTotalLives() >= 5 then
					self:Load(THEME:GetPathG("LifeMeterBattery","lives/_8frame_2013"));
				else
					self:Load(THEME:GetPathG("LifeMeterBattery","lives/_4frame_2013"));
				end
			elseif glifemeter:GetTotalLives() >= 5 then
				self:Load(THEME:GetPathG("LifeMeterBattery","lives/_8frame_2013"));
			else
				--[[
				if style == "StyleType_TwoPlayersTwoSides" then
					self:Load(THEME:GetPathG("LifeMeterBattery","lives/4frame"));
				else
					local bComboGraphic = ComboGraphic(player);
					if bComboGraphic == '2013' then
						self:Load(THEME:GetPathG("LifeMeterBattery","lives/_4frame_2013"));
						self:zoomx(WideScale(1,0.696));
						self:y(20);
					else
						self:Load(THEME:GetPathG("LifeMeterBattery","lives/4frame"));
						self:y(0);
					end
				end;
				--]]
				self:y(0);
				self:Load(THEME:GetPathG("LifeMeterBattery","lives/_4frame_2013"));
			end
		end;
	};
	--[[
	-- 8 Battery frame
	LoadActor("8frame")..{
		InitCommand=cmd();
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:visible(false)
			elseif glifemeter:GetTotalLives() >= 5 then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- 4 Battery frame
	LoadActor("4frame")..{
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:visible(false)
			elseif glifemeter:GetTotalLives() <= 4 then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- 8 Extra Battery frame
	LoadActor("Extra_8frame")..{
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() >= 5 and (GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2()) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- 4 Extra Battery frame
	LoadActor("Extra_4frame")..{
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() <= 4 and (GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2()) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	--]]
};

return t;