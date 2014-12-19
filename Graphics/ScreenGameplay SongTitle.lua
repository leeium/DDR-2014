return LoadFont("ScreenGameplay","SongTitle") .. {
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		if vSong then
			sText = vSong:GetDisplayFullTitle() .. "\n" .. vSong:GetDisplayArtist()
		end
		if vCourse then
			sText = vSong:GetDisplayFullTitle() .. "\n" .. vSong:GetDisplayArtist()
		end
		self:settext( sText );
		self:horizalign(left);
		self:playcommand( "On" );
		self:strokecolor(color("#000000"));
		self:maxwidth(376);
	end;
};