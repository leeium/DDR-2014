local t = Def.ActorFrame {};
local gc = Var("GameCommand");
local max_stages = PREFSMAN:GetPreference( "SongsPerPlay" );
local index = gc:GetIndex();
local c = 0;
if index == 0 then
	c = 1;
elseif index == 1 then
	c = 1;
elseif index == 2 then
	c = 0;
elseif index == 3 then
	c = 0;
elseif index == 4 then
	c = 0;
end
--------------------------------------
t[#t+1] = Def.ActorFrame {
    LoadActor("preview " .. gc:GetName() ) .. {
	InitCommand=cmd(x,0;y,30);
	OnCommand=cmd();
	GainFocusCommand=cmd(linear,0.2;zoom,0.8);
	LoseFocusCommand=cmd(linear,0.2;zoom,0.6);
	};
};

return t;