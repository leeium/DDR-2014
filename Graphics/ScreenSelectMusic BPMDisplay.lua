return Def.BPMDisplay {
	File=THEME:GetPathF("BPMDisplay", "bpm");
	Name="BPMDisplay";
	SetCommand=function(self) self:SetFromGameState() self:diffuse(color("#000000")); end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
};