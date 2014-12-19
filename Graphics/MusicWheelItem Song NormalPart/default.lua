local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing
local t = Def.ActorFrame {
		LoadActor("Backing")..{
		InitCommand=cmd(zoom,0.815;y,-2;setsize,370,440);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		if song then
		local group_colors= {
				["DanceDanceRevolution 1stMIX"]= "#b4e556",
				["DanceDanceRevolution 2ndMIX"]= "#eb8bc8",
				["DanceDanceRevolution 3rdMIX"]= "#fdf380",
				["DanceDanceRevolution 4thMIX"]= "#a592d5",
				["DanceDanceRevolution 5thMIX"]= "#12d0f2",
				["DanceDanceRevolution 6thMIX MAX"]= "#ffbe32",
				["DanceDanceRevolution 7thMIX MAX2"]= "#fa4b3c",
				["DanceDanceRevolution 8thMIX EXTREME"]= "#81f1a9",
				["DanceDanceRevolution SuperNOVA"]= "#fa4b3c",
				["DanceDanceRevolution SuperNOVA2"]= "#12cff2",
				["DanceDanceRevolution X"]= "#ffbe32",
				["DanceDanceRevolution X2"]= "#eb8cc8",
				["DanceDanceRevolution X3"]= "#16b5ef",
				["DDR 2013"]= "#69ebca",
				["DDR 2014"]= "#69ebca",
				-- genre/bemani series sort
				["Pop"]= "#ffbe32",
				["Anime/Game"]=	"#fff582",
				["Variety"]= "#eb8cc8",
				["GUMI 5th anniversary"]=	"#b8e267",
				["U.M.U. x BEMANI"]= "#fbafb4",
				["KONAMI originals"]= "#fa4b3c",
			}
		local color_grp= group_colors[song:GetGroupName()] or "#FFFFFF"
--I know Strider had a nicer, cleaner way to do this but I'm not risking having to rewrite it all again
			--ABC sort (uses 2013 colours)
						local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_Title" or so == "SortOrder_Artist" then
				self:diffuse(color("#fff582"));
			elseif so == "SortOrder_BeginnerMeter" or so == "SortOrder_EasyMeter" or so == "SortOrder_MediumMeter" or so == "SortOrder_HardMeter" or so == "SortOrder_ChallengeMeter" then
				self:diffuse(color("#0167ae"));
			elseif so == "SortOrder_BPM" then
				self:diffuse(color("#69ebca"));
			elseif so == "SortOrder_Popularity" then
				self:diffuse(color("#b679fd"));
			elseif so == "SortOrder_TopGrades" then
				self:diffuse(color("#7dff44"));	
			elseif so == "SortOrder_Genre" then
				if group == "Pop" then
					self:diffuse(color("#ffbe32"));
				elseif group == "Anime/Game" then
					self:diffuse(color("#fff582"));
				elseif group == "Variety" then
					self:diffuse(color("#eb8cc8"));
				elseif group == "GUMI 5th anniversary" then
					self:diffuse(color("#b8e267"));
				elseif group == "U.M.U. x BEMANI" then
					self:diffuse(color("#fbafb4"));
				elseif group == "KONAMI originals" then
					self:diffuse(color("#fa4b3c"));
				elseif group == "beatmania IIDX" then
					self:diffuse(color("#0165ac"));
				elseif group == "pop'n music" then
					self:diffuse(color("#fff582"));
				elseif group == "GITADORA" then
					self:diffuse(color("#a592d5"));
				elseif group == "jubeat" then
					self:diffuse(color("#f1f5fb"));
				elseif group == "REFLEC BEAT" then
					self:diffuse(color("#81f1a9"));
				elseif group == "DanceEvolution" then
					self:diffuse(color("#12d0f2"));
				elseif group == "SOUND VOLTEX" then
					self:diffuse(color("#eb8cc8"));
				elseif group == "FutureTomTom" then
					self:diffuse(color("#fff582"));	
				elseif group == "DDR" then
					self:diffuse(color("#43ff9d"));
				else 
					self:diffuse(color("#ffffff"));					
				end;
			else
			self:diffuse(color(color_grp))
			self:diffusealpha(1)
			end;
		self:diffusealpha(1)
		end;
	end;
};
--border default
LoadActor(THEME:GetPathG("MusicWheelItem Song","NormalPart/Borders/default.png"))..{
		InitCommand=cmd(scaletoclipped,240,240);
		};
Def.Sprite{
	InitCommand=cmd(scaletoclipped,240,240);
	SetMessageCommand=function(self,params)
	local song = params.Song;
	local pssp1 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P1")
	local staw1 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
	local pssp2 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P2")
		if song then
			if not PROFILEMAN:IsSongNew(params.Song) then
			self:Load(THEME:GetPathG("MusicWheelItem Song","NormalPart/Borders/cleared.png"));
			self:diffusealpha(1);
			self:draworder(1);
			else
			self:diffusealpha(0);
			end;
		end;
	end;
};
		
--banner frame
--[[	Def.Quad{
		InitCommand=cmd(shadowlengthx,0;shadowlengthy,2);
		SetMessageCommand=function(self, params)
			local song = params.Song;
		if song then
		local group_colors= {
				["DanceDanceRevolution 1stMIX"]= "#99FF66",
				["DanceDanceRevolution 2ndMIX"]= "#FF6633",
				["DanceDanceRevolution 3rdMIX"]= "#FFFF66",
				["DanceDanceRevolution 4thMIX"]= "#CC66FF",
				["DanceDanceRevolution 5thMIX"]= "#66CCFF",
				["DanceDanceRevolution 6thMIX MAX"]= "#FF9900",
				["DanceDanceRevolution 7thMIX MAX2"]= "#FF3333",
				["DanceDanceRevolution 8thMIX EXTREME"]= "#00CC33",
				["DanceDanceRevolution SuperNOVA"]= "#CC0000",
				["DanceDanceRevolution SuperNOVA2"]= "#33CCFF",
				["DanceDanceRevolution X"]= "#FF9933",
				["DanceDanceRevolution X2"]= "#FF33CC",
				["DanceDanceRevolution X3"]= "#5970b3",
				["DDR 2013"]= "#59b386",
				["DDR 2014"]= "#59b386",
				["Next Generation"]= "#FFFFFF",
				["NG Extra 1"]= "#FF0000",
				["NG Extra 2"]= "#FF0000",
			}
			local color_str= group_colors[song:GetGroupName()] or "#FFFFFF"
			self:diffuse(color(color_str))
			self:diffusealpha(1)
			self:setsize(240,240);
		end;
	end;
};--]]
--title part
	LoadActor("title")..{
	InitCommand=cmd(zoomy,0.815;zoomx,0.78;y,1);
	};
Def.Quad {
	InitCommand=cmd(setsize,223,223;diffuse,color("#000000"));
	};
--banner
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(scaletoclipped,220,220);
		BannerCommand=cmd(scaletoclipped,220,220);
		JacketCommand=cmd(scaletoclipped,220,220);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Song:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBannerPath() ~= nil ) then
					self:Load( Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath );
				  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:Load( sJacketPath );
					self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end
			else
				self:Load( bAllowJackets and sJacketPath or sBannerPath );
				self:playcommand( bAllowJackets and "Jacket" or "Banner" );
			end;
		end;
	};
--new song
	LoadActor("NEW") .. {
		InitCommand=cmd(y,-157.5;finishtweening;draworder,1;zoom,1;bob;effectmagnitude,0,5,0);
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
	};
--P1 Meter
	LoadFont("Common Normal")..{
		InitCommand=cmd(player,PLAYER_1;x,-100;zoom,0.5;y,-145;draworder,2;diffuse,color("#000000");strokecolor,color("Outline"));
		OnCommand=cmd(zoom,1);
		SetMessageCommand=function(self,params)
		local song = params.Song
			if song then
		local steps = SongUtil.GetPlayableSteps( song )
	for i,step in ipairs(steps) do
		self:settext( step:GetMeter() )
	end;
	end;
	end;
	};
--P2 Meter
	LoadFont("Common Normal")..{
		InitCommand=cmd(player,PLAYER_2;x,100;zoom,0.5;y,-145;draworder,2;diffuse,color("#000000");strokecolor,color("Outline"));
		OnCommand=cmd(zoom,1);
		SetMessageCommand=function(self,params)
		local song = params.Song
			if song then
		local steps = SongUtil.GetPlayableSteps( song )
	for i,step in ipairs(steps) do
		local child = ( step:GetDifficulty() )
		self:settext( step:GetMeter() )
	end;
	end;
	end;
	};	
};
return t;