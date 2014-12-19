local group;

local t = Def.ActorFrame{
	LoadActor("Backing")..{
		InitCommand=cmd(zoom,0.815;y,-2;setsize,368,440);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		if group then
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
			}
		local color_grp= group_colors[group] or "#FFFFFF"
--I know Strider had a nicer, cleaner way to do this but I'm not risking having to rewrite it all again
			--Edit Data folder
--			if group=='Edit Data' then
--				self:visible(false);
			--ABC sort (uses 2013 colours)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_Title" or so == "SortOrder_Artist" then
				self:diffuse(color("#fff582"));
			--difficulty sort (uses X2/X3 colours)
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
			elseif group=='Beatmania IIDX' then
				self:diffuse(color("#4b4795"));
			elseif group=="pop'n music" then
				self:diffuse(color("#ffea00"));
			elseif group=='GITADORA' then
				self:diffuse(color("#d200ff"));
			elseif group=='jubeat' then
				self:diffuse(color("#ffffff"));
			elseif group=='REFLEC BEAT' then
				self:diffuse(color("#00ff8a"));
			elseif group=='Dance Evolution' then
				self:diffuse(color("#00f0ff"));
			elseif group=='SOUND VOLTEX' then
				self:diffuse(color("#ff00c6"));
			elseif group=='Future Tom Tom' then
				self:diffuse(color("#ffd200"));
			else
			self:diffuse(color(color_grp))
			self:diffusealpha(1)
			end;
		self:diffusealpha(1)
		end;
	end;
};
LoadActor("Shadow")..{
		InitCommand=cmd(addx,-5;addy,8;zoom,1.1);
		SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if so == "SortOrder_Group" or so == "SortOrder_Genre" then
			if group == "N/A" or group == "beatmania IIDX" or group == "DDR" or group == "DanceEvolution"
			or group == "GITADORA" or group == "pop'n music" or group == "jubeat" or group == "REFLEC BEAT" 
			or group == "FutureTomTom" or group == "SOUND VOLTEX" then
			self:diffusealpha(0);
			else
			self:diffusealpha(1);
			end;
		else
			self:diffusealpha(0);
		end;
		end;
		};
--group title
Def.Sprite {
		InitCommand=cmd(addx,-5;addy,-73);
		SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
			if so == "SortOrder_Title" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group name","Alphabet"));
			elseif so == "SortOrder_BeginnerMeter" or so == "SortOrder_EasyMeter" or so == "SortOrder_MediumMeter" or so == "SortOrder_HardMeter" or so == "SortOrder_ChallengeMeter" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group name","Dance Level"));
			elseif so == "SortOrder_BPM" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group name","BPM"));
			elseif so == "SortOrder_Popularity" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group name","Popularity"));
			elseif so == "SortOrder_TopGrades" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group name","Cleared Rank"));
			elseif so == "SortOrder_Genre" then
				self:diffusealpha(1);
				--genre sort
				if group == "Pop" then
				self:Load(THEME:GetPathG("group name genre","Pop"));
				elseif group == "Anime/Game" then
				self:Load(THEME:GetPathG("group name genre","AnimeGame"));
				elseif group == "Variety" then
				self:Load(THEME:GetPathG("group name genre","Variety"));
				elseif group == "GUMI 5th anniversary" then
				self:Load(THEME:GetPathG("group name genre","GUMI"));
				elseif group == "U.M.U. x BEMANI" then
				self:Load(THEME:GetPathG("group name genre","UMU"));
				elseif group == "KONAMI originals" then
				self:Load(THEME:GetPathG("group name genre","KONAMI"));
				--series sort
				elseif group == "beatmania IIDX" then
				self:Load(THEME:GetPathG("group name series","IIDX"));
				elseif group == "pop'n music" then
				self:Load(THEME:GetPathG("group name series","popn"));
				elseif group == "GITADORA" then
				self:Load(THEME:GetPathG("group name series","GITADORA"));
				elseif group == "jubeat" then
				self:Load(THEME:GetPathG("group name series","jubeat"));
				elseif group == "REFLEC BEAT" then
				self:Load(THEME:GetPathG("group name series","RB"));
				elseif group == "DanceEvolution" then
				self:Load(THEME:GetPathG("group name series","DanceEvolution"));
				elseif group == "SOUND VOLTEX" then
				self:Load(THEME:GetPathG("group name series","SDVX"));
				elseif group == "FutureTomTom" then
				self:Load(THEME:GetPathG("group name series","FutureTomTom"));
				else
					self:diffusealpha(0);
				end;
			elseif so == "SortOrder_Group" then
					if group=='DanceDanceRevolution 1stMIX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","1st"));
					elseif group=='DanceDanceRevolution 2ndMIX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","2nd"));
					elseif group=='DanceDanceRevolution 3rdMIX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","3rd"));
					elseif group=='DanceDanceRevolution 4thMIX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","4th"));	
					elseif group=='DanceDanceRevolution 5thMIX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","5th"));	
					elseif group=='DanceDanceRevolution 6thMIX MAX' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","MAX1"));	
					elseif group=='DanceDanceRevolution 7thMIX MAX2' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","MAX2"));	
					elseif group=='DanceDanceRevolution 8thMIX EXTREME' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","Extreme"));	
					elseif group=='DanceDanceRevolution SuperNOVA' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","SN1"));
					elseif group=='DanceDanceRevolution SuperNOVA2' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","SN2"));
					elseif group=='DanceDanceRevolution X' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","X1"));
					elseif group=='DanceDanceRevolution X2' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","X2"));
					elseif group=='DanceDanceRevolution X3' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","X3"));
					elseif group=='DDR 2013' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","2013"));
					elseif group=='DDR 2014' then
					self:diffusealpha(1);
					self:Load(THEME:GetPathG("group name","DDR"));
					else
					self:diffusealpha(0);
					end;
				end;
			end;
		end;
		};
Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,220,220;addx,-5);
		SetMessageCommand=function(self,params)
					group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if group=='A' then
					self:Load(THEME:GetPathG("group title","A"));
				elseif group=='B' then
					self:Load(THEME:GetPathG("group title","B"));
				elseif group=='C' then
					self:Load(THEME:GetPathG("group title","C"));
				elseif group=='D' then
					self:Load(THEME:GetPathG("group title","D"));
				elseif group=='E' then
					self:Load(THEME:GetPathG("group title","E"));
				elseif group=='F' then
					self:Load(THEME:GetPathG("group title","F"));
				elseif group=='G' then
					self:Load(THEME:GetPathG("group title","G"));
				elseif group=='H' then
					self:Load(THEME:GetPathG("group title","H"));
				elseif group=='I' then
					self:Load(THEME:GetPathG("group title","I"));
				elseif group=='J' then
					self:Load(THEME:GetPathG("group title","J"));
				elseif group=='K' then
					self:Load(THEME:GetPathG("group title","K"));
				elseif group=='L' then
					self:Load(THEME:GetPathG("group title","L"));
				elseif group=='M' then
					self:Load(THEME:GetPathG("group title","M"));
				elseif group=='N' then
					self:Load(THEME:GetPathG("group title","N"));
				elseif group=='O' then
					self:Load(THEME:GetPathG("group title","O"));
				elseif group=='P' then
					self:Load(THEME:GetPathG("group title","P"));
				elseif group=='Q' then
					self:Load(THEME:GetPathG("group title","Q"));
				elseif group=='R' then
					self:Load(THEME:GetPathG("group title","R"));
				elseif group=='S' then
					self:Load(THEME:GetPathG("group title","S"));
				elseif group=='T' then
					self:Load(THEME:GetPathG("group title","T"));
				elseif group=='U' then
					self:Load(THEME:GetPathG("group title","U"));
				elseif group=='V' then
					self:Load(THEME:GetPathG("group title","V"));
				elseif group=='W' then
					self:Load(THEME:GetPathG("group title","W"));
				elseif group=='X' then
					self:Load(THEME:GetPathG("group title","X"));
				elseif group=='Y' then
					self:Load(THEME:GetPathG("group title","Y"));
				elseif group=='Z' then
					self:Load(THEME:GetPathG("group title","Z"));
				elseif group=='0-9' then
					self:Load(THEME:GetPathG("group title","0-9"));					
					
				elseif group=='01' then
					self:Load(THEME:GetPathG("group diff","01"));
				elseif group=='02' then
					self:Load(THEME:GetPathG("group diff","02"));
				elseif group=='03' then
					self:Load(THEME:GetPathG("group diff","03"));
				elseif group=='04' then
					self:Load(THEME:GetPathG("group diff","04"));
				elseif group=='05' then
					self:Load(THEME:GetPathG("group diff","05"));
				elseif group=='06' then
					self:Load(THEME:GetPathG("group diff","06"));
				elseif group=='07' then
					self:Load(THEME:GetPathG("group diff","07"));
				elseif group=='08' then
					self:Load(THEME:GetPathG("group diff","08"));
				elseif group=='09' then
					self:Load(THEME:GetPathG("group diff","09"));
				elseif group=='10' then
					self:Load(THEME:GetPathG("group diff","10"));
				elseif group=='11' then
					self:Load(THEME:GetPathG("group diff","11"));
				elseif group=='12' then
					self:Load(THEME:GetPathG("group diff","12"));
				elseif group=='13' then
					self:Load(THEME:GetPathG("group diff","13"));
				elseif group=='14' then
					self:Load(THEME:GetPathG("group diff","14"));
				elseif group=='15' then
					self:Load(THEME:GetPathG("group diff","15"));
				elseif group=='16' then
					self:Load(THEME:GetPathG("group diff","16"));
				elseif group=='17' then
					self:Load(THEME:GetPathG("group diff","17"));
				elseif group=='18' then
					self:Load(THEME:GetPathG("group diff","18"));
				elseif group=='19' then
					self:Load(THEME:GetPathG("group diff","19"));
				elseif group=='20' then
					self:Load(THEME:GetPathG("group diff","20"));
				
				elseif group=='000-019' then
					self:Load(THEME:GetPathG("group bpm","000"));
				elseif group=='020-039' then
					self:Load(THEME:GetPathG("group bpm","020"));
				elseif group=='040-059' then
					self:Load(THEME:GetPathG("group bpm","040"));
				elseif group=='060-079' then
					self:Load(THEME:GetPathG("group bpm","060"));	
				elseif group=='080-099' then
					self:Load(THEME:GetPathG("group bpm","080"));
					
				elseif group=='100-119' then
					self:Load(THEME:GetPathG("group bpm","100"));
				elseif group=='120-139' then
					self:Load(THEME:GetPathG("group bpm","120"));
				elseif group=='140-159' then
					self:Load(THEME:GetPathG("group bpm","140"));
				elseif group=='160-179' then
					self:Load(THEME:GetPathG("group bpm","160"));	
				elseif group=='180-199' then
					self:Load(THEME:GetPathG("group bpm","180"));
					
				elseif group=='200-219' then
					self:Load(THEME:GetPathG("group bpm","200"));
				elseif group=='220-239' then
					self:Load(THEME:GetPathG("group bpm","220"));
				elseif group=='240-259' then
					self:Load(THEME:GetPathG("group bpm","240"));
				elseif group=='260-279' then
					self:Load(THEME:GetPathG("group bpm","260"));	
				elseif group=='280-299' then
					self:Load(THEME:GetPathG("group bpm","280"));
					
				elseif group=='300-319' then
					self:Load(THEME:GetPathG("group bpm","300"));
				elseif group=='320-339' then
					self:Load(THEME:GetPathG("group bpm","320"));
				elseif group=='340-359' then
					self:Load(THEME:GetPathG("group bpm","340"));
				elseif group=='360-379' then
					self:Load(THEME:GetPathG("group bpm","360"));	
				elseif group=='380-399' then
					self:Load(THEME:GetPathG("group bpm","380"));
					
				elseif group=='400-419' then
					self:Load(THEME:GetPathG("group bpm","400"));
				elseif group=='420-439' then
					self:Load(THEME:GetPathG("group bpm","420"));
				elseif group=='440-459' then
					self:Load(THEME:GetPathG("group bpm","440"));
				elseif group=='460-479' then
					self:Load(THEME:GetPathG("group bpm","460"));	
				elseif group=='480-499' then
					self:Load(THEME:GetPathG("group bpm","480"));

				elseif group=='500-519' then
					self:Load(THEME:GetPathG("group bpm","500"));
				elseif group=='520-539' then
					self:Load(THEME:GetPathG("group bpm","520"));
				elseif group=='540-559' then
					self:Load(THEME:GetPathG("group bpm","540"));
				elseif group=='560-579' then
					self:Load(THEME:GetPathG("group bpm","560"));	
				elseif group=='580-599' then
					self:Load(THEME:GetPathG("group bpm","580"));

				elseif group=='600-619' then
					self:Load(THEME:GetPathG("group bpm","600"));
				elseif group=='620-639' then
					self:Load(THEME:GetPathG("group bpm","620"));
				elseif group=='640-659' then
					self:Load(THEME:GetPathG("group bpm","640"));
				elseif group=='660-679' then
					self:Load(THEME:GetPathG("group bpm","660"));	
				elseif group=='680-699' then
					self:Load(THEME:GetPathG("group bpm","680"));

				elseif group=='700-719' then
					self:Load(THEME:GetPathG("group bpm","700"));
				elseif group=='720-739' then
					self:Load(THEME:GetPathG("group bpm","720"));
				elseif group=='740-759' then
					self:Load(THEME:GetPathG("group bpm","740"));
				elseif group=='760-779' then
					self:Load(THEME:GetPathG("group bpm","760"));	
				elseif group=='780-799' then
					self:Load(THEME:GetPathG("group bpm","780"));

				elseif group=='800-819' then
					self:Load(THEME:GetPathG("group bpm","800"));
				elseif group=='820-839' then
					self:Load(THEME:GetPathG("group bpm","820"));
				elseif group=='840-859' then
					self:Load(THEME:GetPathG("group bpm","840"));
				elseif group=='860-879' then
					self:Load(THEME:GetPathG("group bpm","860"));	
				elseif group=='880-899' then
					self:Load(THEME:GetPathG("group bpm","880"));

				elseif group=='900-919' then
					self:Load(THEME:GetPathG("group bpm","900"));
				elseif group=='920-939' then
					self:Load(THEME:GetPathG("group bpm","220"));
				elseif group=='940-959' then
					self:Load(THEME:GetPathG("group bpm","940"));
				elseif group=='960-979' then
					self:Load(THEME:GetPathG("group bpm","960"));	
				elseif group=='980-999' then
					self:Load(THEME:GetPathG("group bpm","980"));
					
				elseif group=='1000-1019' then
					self:Load(THEME:GetPathG("group bpm","a1000"));
					
				elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" or
					   group=="AAA x 9" or group=="AAA x 8" or group=="AAA x 7" or group=="AAA x 6" or group=="AAA x 5" or group=="AAA x 4" or group=="AAA x 3" or group=="AAA x 2" or group=="AAA x 1" then
					self:Load(THEME:GetPathG("group grade","AAA"));
				elseif group=="AA x 9" or group=="AA x 8" or group=="AA x 7" or group=="AA x 6" or group=="AA x 5" or group=="AA x 4" or group=="AA x 3" or group=="AA x 2" or group=="AA x 1" then
					self:Load(THEME:GetPathG("group grade","AA"));
				elseif group=="A x 9" or group=="A x 8" or group=="A x 7" or group=="A x 6" or group=="A x 5" or group=="A x 4" or group=="A x 3" or group=="A x 2" or group=="A x 1" then
					self:Load(THEME:GetPathG("group grade","A"));
				elseif group=="B x 9" or group=="B x 8" or group=="B x 7" or group=="B x 6" or group=="B x 5" or group=="B x 4" or group=="B x 3" or group=="B x 2" or group=="B x 1" then
					self:Load(THEME:GetPathG("group grade","B"));
				elseif group=="C x 9" or group=="C x 8" or group=="C x 7" or group=="C x 6" or group=="C x 5" or group=="C x 4" or group=="C x 3" or group=="C x 2" or group=="C x 1" then
					self:Load(THEME:GetPathG("group grade","C"));
				elseif group=="D x 9" or group=="D x 8" or group=="D x 7" or group=="D x 6" or group=="D x 5" or group=="D x 4" or group=="D x 3" or group=="D x 2" or group=="D x 1" then
					self:Load(THEME:GetPathG("group grade","D"));
					
					
				elseif group=="???" then
					if so == "SortOrder_TopGrades" then
					self:Load(THEME:GetPathG("group cleared rank","unplayed"));
					end;
					
				elseif group == "Pop" then
					self:Load(THEME:GetPathG("group jacket","Pop"));
				elseif group == "Anime/Game" then
					self:Load(THEME:GetPathG("group jacket","AnimeGame"));
				elseif group == "Variety" then
					self:Load(THEME:GetPathG("group jacket","Variety"));
				elseif group == "GUMI 5th anniversary" then
					self:Load(THEME:GetPathG("group jacket","GUMI"));
				elseif group == "U.M.U. x BEMANI" then
					self:Load(THEME:GetPathG("group jacket","UMU"));
				elseif group == "KONAMI originals" then
					self:Load(THEME:GetPathG("group jacket","KONAMI"));	
					
				elseif group == "beatmania IIDX" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "pop'n music" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "GITADORA" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "jubeat" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "REFLEC BEAT" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "Dance Evolution" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "SOUND VOLTEX" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "FutureTomTom" then
				self:Load(THEME:GetPathG("group jacket","blank"));
				elseif group == "DDR" then
				self:Load(THEME:GetPathG("group jacket","blank"));
					
				elseif group=='N/A' or group=='- EMPTY -'then
					self:Load(THEME:GetPathG("group global","NA"));
					
				elseif group=='Nonstop'then
					self:Load(THEME:GetPathG("group COURSE","NORMAL"));
				elseif group=='Oni'then
					self:Load(THEME:GetPathG("group COURSE","CHALLENGE"));
				else
				
			
					self:LoadFromSongGroup(group);
				end
			else
				-- call fallback
				self:Load( THEME:GetPathG("","_No banner") );
			end;

		end;
	};
Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(addx,-5;addy,5);
		SetMessageCommand=function(self,params)
			group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if so == "SortOrder_Genre" then
					if group == "beatmania IIDX" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","IIDX"));
					elseif group == "pop'n music" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","popn"));
					elseif group == "GITADORA" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","GITADORA"));
					elseif group == "jubeat" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","jubeat"));
					elseif group == "REFLEC BEAT" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","RB"));
					elseif group == "Dance Evolution" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","DanceEvolution"));
					elseif group == "SOUND VOLTEX" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","SDVX"));
					elseif group == "FutureTomTom" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","FutureTomTom"));
					elseif group == "DDR" then
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("group jacket series","DDR"));
					else
						self:diffusealpha(0);
					end;
				else
					self:diffusealpha(0);
				end;
			end;
			end;
		};
	LoadFont("_itc avant garde std bk 20px")..{
		InitCommand=cmd(y,-148;zoom,1.4;addx,-5;maxwidth,200);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group=='DanceDanceRevolution 1stMIX' or
		group=='DanceDanceRevolution 2ndMIX' or
		group=='DanceDanceRevolution 3rdMIX' or 
		group=='DanceDanceRevolution 4thMIX' or 
		group=='DanceDanceRevolution 5thMIX' or 
		group=='DanceDanceRevolution 6thMIX MAX' or
		group=='DanceDanceRevolution 7thMIX MAX2' or
		group=='DanceDanceRevolution 8thMIX EXTREME' or
		group=='DanceDanceRevolution SuperNOVA' or	
		group=='DanceDanceRevolution SuperNOVA2' or	
		group=='DanceDanceRevolution X' or
		group=='DanceDanceRevolution X2' or
		group=='DanceDanceRevolution X3' or
		group=='DDR 2013' or	
		group=='DDR 2014' then	
			self:settext("");
		else
			if so == "SortOrder_Group" then
			self:settext(group);
			self:shadowlengthy(2);
			self:diffuse(color("#000000"));
			else
			self:settext("");
			end;
		end;
		end;
	};	
};
return t;