local c;
local cf;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

local t = Def.ActorFrame {
	Def.ActorFrame {
		Name="ComboFrame";
		LoadFont( "combo", "marv" ) .. {
			Name="NumberW1";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "perf" ) .. {
			Name="NumberW2";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "great" ) .. {
			Name="NumberW3";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "normal") .. {
			Name="NumberNormal";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadActor("_combomarv") .. {
			Name="LabelW1";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_comboperfect") .. {
			Name="LabelW2";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_combogreat") .. {
			Name="LabelW3";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_combonormal") .. {
			Name="LabelNormal";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
	LoadActor(THEME:GetPathG("Combo","100Milestone")) .. {
		Name="OneHundredMilestone";
		InitCommand=cmd(visible,true);
		FiftyMilestoneCommand=cmd(playcommand,"Milestone");
	};
	LoadActor(THEME:GetPathG("Combo","1000Milestone")) .. {
		Name="OneThousandMilestone";
		InitCommand=cmd(visible,true);
		ToastyAchievedMessageCommand=cmd(playcommand,"Milestone");
	};
	};
	InitCommand = function(self)
		c = self:GetChildren();
		cf = c.ComboFrame:GetChildren();
		-- Inclu
		cf.NumberW1:visible(false);
		cf.NumberW2:visible(false);
		cf.NumberW3:visible(false);
		cf.NumberNormal:visible(false);
		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(false);
	end;
	ComboCommand=function(self, param)
		local iCombo = param.Misses or param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
			return;
		end

		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(true);

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, LabelMaxZoom );

		cf.NumberW1:settext( string.format("%i", iCombo) );
		cf.NumberW2:settext( string.format("%i", iCombo) );
		cf.NumberW3:settext( string.format("%i", iCombo) );
		cf.NumberNormal:settext( string.format("%i", iCombo) );
		-- FullCombo Rewards
		if param.FullComboW1 then
			cf.NumberW1:visible(true);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);
			
			cf.LabelW1:visible(true);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif param.FullComboW2 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(true);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);
			
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(true);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif param.FullComboW3 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(true);
			cf.NumberNormal:visible(false);
			
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(true);
			cf.LabelNormal:visible(false);
		elseif param.Combo then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(true);
			
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(true);
		else
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(true);
			
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(true);
		end
		-- Pulse
		Pulse( cf.NumberW1, param );
		Pulse( cf.NumberW2, param );
		Pulse( cf.NumberW3, param );
		Pulse( cf.NumberNormal, param );
		PulseLabel( cf.LabelW1, param );
		PulseLabel( cf.LabelW2, param );
		PulseLabel( cf.LabelW3, param );
		PulseLabel( cf.LabelNormal, param );
		-- Milestone Logic
	end;
};

return t;