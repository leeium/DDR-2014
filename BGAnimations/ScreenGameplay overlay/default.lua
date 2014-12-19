local t = Def.ActorFrame{};
-- Full combo
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo", pn) .. {
	};
end;

return t;