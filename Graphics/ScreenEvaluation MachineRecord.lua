local Player = ...
assert(Player,"MachineRecord needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local record = stats:GetMachineHighScoreIndex()
local hasMachineRecord = record ~= -1
local t = Def.ActorFrame {};
t[#t+1] = LoadActor("Machine Record1.png")..{
	InitCommand=cmd(pulse;effectmagnitude,0.85,0.9,0);
	BeginCommand=function(self)
		self:visible(hasMachineRecord);
	end;
};
t[#t+1] = LoadActor(THEME:GetPathS("", "NewRecord"))..{
	BeginCommand=function(self)
		if hasMachineRecord then
			self:play();
		else
			self:stop();
		end;
	end;
};
return t