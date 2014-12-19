local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
local bannerPath;

function GetSongBanner(song)
	if song then
		local path = song:GetBannerPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback banner")
end

function GetSongBg(song)
	if song then
		local path = song:GetBackgroundPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback background")
end
--main backing
local t = Def.ActorFrame {
		LoadActor("Backing")..{
		InitCommand=cmd(zoom,0.815;y,-2;setsize,370,440);
};
LoadActor(THEME:GetPathG("MusicWheelItem Song","NormalPart/Borders/default.png"))..{
		InitCommand=cmd(scaletoclipped,240,240);
		};
--title part
	LoadActor("title")..{
	InitCommand=cmd(zoom,0.815;y,1);
	};
--banner
	Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,220,220;);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
			if song and not course then
				-- this is where we do all song-specific stuff
				--self:LoadFromSong(params.Song);
				self:LoadBackground(GetSongBanner(params.Song));
				--self:LoadFromCachedBanner(GetSongBanner(params.Song));
				--[ja] Ç´ÇßÇ­Ç¿ÇÄªí¥Ü
				--self:LoadBackground(song:GetJacketPath());
				self:position(0);
				--self:rate(0.5);
			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(params.Course);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;

		end;
	};
};
return t;