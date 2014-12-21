-- This variable was passed in to this file (actor) from the parent default.lua
local player = ...
 
-- initialize this value to be false
local ThisPlayerPaneIsOpen = false
 
local function GetDifListX(self,offset)
        if player==PLAYER_1 then
                self:x(150+offset)
        elseif player==PLAYER_2 then
                self:x(_screen.w-220+offset)
        end
end
 
local function DrawDifListItem(diff)
 
        local DifficultyListItem = Def.ActorFrame {
 
                InitCommand=cmd(y, _screen.cy-204 ),
                CurrentSongChangedMessageCommand=cmd(playcommand,"Set"),
                CurrentStepsP1ChangedMessageCommand=function(self) if player == PLAYER_1 then self:playcommand("Set") end end,
                CurrentStepsP2ChangedMessageCommand=function(self) if player == PLAYER_2 then self:playcommand("Set") end end,
                CurrentTrailP1ChangedMessageCommand=function(self) if player == PLAYER_1 then self:playcommand("Set") end end,
                CurrentTrailP2ChangedMessageCommand=function(self) if player == PLAYER_2 then self:playcommand("Set") end end,
                CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"),
				OffCommand=function(self)
					if player == PLAYER_1 then
						(cmd(sleep,0.15; linear,0.25; addx,-500))(self);
					elseif player == PLAYER_2 then
						(cmd(sleep,0.15; linear,0.25; addx,500))(self);
					end;
				end;
               
                --disabled
                Def.Quad{
                        InitCommand=cmd(diffuse,color("#000000");setsize,490,50;zoom,0.7),
                        SetCommand=function(self)
 
                                local st=GAMESTATE:GetCurrentStyle():GetStepsType()
                                local song=GAMESTATE:GetCurrentSong()
                                local course = GAMESTATE:GetCurrentCourse()
 
                                if song then
                                        GetDifListX(self, 35)
                                       
                                        self:y( Difficulty:Reverse()[diff] * 42 + 1.5 )
 
                                        if song:HasStepsTypeAndDifficulty(st,diff) then
                                                self:diffusealpha(0)
                                        else
                                                self:diffusealpha(0.3)
                                        end
                                end
                        end
                },
 
                --meter
                LoadFont("Common Normal")..{
                        InitCommand=cmd(draworder,99; diffuse,color("#000000"); strokecolor,Color.White; zoom,0.9),
                        SetCommand=function(self)
                                self:settext("")
                                local st=GAMESTATE:GetCurrentStyle():GetStepsType()
                                local song=GAMESTATE:GetCurrentSong()
 
                                if song then
                                        GetDifListX(self, -119)
                                        self:y( Difficulty:Reverse()[diff] * 42 )                                      
 
                                        if song:HasStepsTypeAndDifficulty( st, diff ) then
                                                local steps = song:GetOneSteps( st, diff )
                                                self:settext( steps:GetMeter() )
                                        end
                                end
                        end
                },
 
 
                --score number
                LoadFont("Common Normal")..{
                        InitCommand=cmd(zoom,0.8;draworder,5);
                        BeginCommand=cmd(playcommand,"Set");
                        OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
                        SetCommand=function(self)
                                self:settext("")
                               
                                local st=GAMESTATE:GetCurrentStyle():GetStepsType()
                                local song=GAMESTATE:GetCurrentSong()
                                local course = GAMESTATE:GetCurrentCourse()
 
                                if song then
                                        GetDifListX(self, 130)
                                        self:y( (Difficulty:Reverse()[diff]) * 42 )
 
                                        if song:HasStepsTypeAndDifficulty(st,diff) then
 
                                                local steps = song:GetOneSteps( st, diff )
 
                                                if PROFILEMAN:IsPersistentProfile(player) then
                                                        profile = PROFILEMAN:GetProfile(player)
                                                else
                                                        profile = PROFILEMAN:GetMachineProfile()
                                                end
 
                                                scorelist = profile:GetHighScoreList(song,steps)
                                                local scores = scorelist:GetHighScores()
                                                local topscore=0
 
                                                if scores[1] then
                                                        topscore = scores[1]:GetScore()
                                                end
 
                                                self:diffuse(color("1,1,1,1"))
                                                self:strokecolor(color("0.2,0.2,0.2,1"))
                                                self:diffusealpha(1)
                                                self:shadowlength(2)
 
                                                if topscore ~= 0  then
                                                        local scorel3 = topscore%1000
                                                        local scorel2 = (topscore/1000)%1000
                                                        local scorel1 = (topscore/1000000)%1000000
                                                        self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3)
                                                end
                                        end
                                end
                        end
                },
 
 
                --grade
                Def.Quad{
                        InitCommand=cmd(zoom,0.3;draworder,5),
                        BeginCommand=cmd(playcommand,"Set"),
                        OffCommand=cmd(decelerate,0.05;diffusealpha,0;),
                        SetCommand=function(self)
 
                                local st=GAMESTATE:GetCurrentStyle():GetStepsType()
                                local song=GAMESTATE:GetCurrentSong()
                                local course = GAMESTATE:GetCurrentCourse()
 
                                if song then
                                        GetDifListX(self,128)
                                        self:y( (Difficulty:Reverse()[diff]) * 42 )
 
                                        if song:HasStepsTypeAndDifficulty(st,diff) then
 
                                                local steps = song:GetOneSteps( st, diff )
 
                                                if PROFILEMAN:IsPersistentProfile(player) then
                                                        profile = PROFILEMAN:GetProfile(player)
                                                else
                                                        profile = PROFILEMAN:GetMachineProfile()
                                                end
 
                                                scorelist = profile:GetHighScoreList(song,steps)
                                                local scores = scorelist:GetHighScores()
 
                                                local topscore=0
                                                if scores[1] then
                                                        topscore = scores[1]:GetScore()
                                                end
 
                                                local topgrade
                                                if scores[1] then
                                                        topgrade = scores[1]:GetGrade();
                                                        assert(topgrade);
                                                        if scores[1]:GetScore()>1  then
                                                                if scores[1]:GetScore()==1000000 and topgrade=="Grade_Tier07" then
                                                                        self:LoadBackground(THEME:GetPathG("myMusicWheel","Tier01"));
                                                                        self:diffusealpha(1);
                                                                        self:addx(-60);
                                                                else
                                                                        self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(topgrade)));
                                                                        self:diffusealpha(1);
                                                                        self:addx(-60);
                                                                end;
                                                        else
                                                                self:diffusealpha(0);
                                                        end;
                                                else
                                                        self:diffusealpha(0);
                                                end;
                                        else
                                                self:diffusealpha(0);
                                        end;
                                else
                                        self:diffusealpha(0);
                                end
                        end
                };
 
 
                --FC Ring
                LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
                        InitCommand=cmd(shadowlength,1;zoom,0;draworder,5);
                        BeginCommand=cmd(playcommand,"Set");
                        OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
                        SetCommand=function(self)
                                local st=GAMESTATE:GetCurrentStyle():GetStepsType();
                                local song=GAMESTATE:GetCurrentSong();
                                local course = GAMESTATE:GetCurrentCourse();
                        if song then
                                GetDifListX(self, 110);
                                self:y( (Difficulty:Reverse()[diff]) * 42 - 19 );
                                if song:HasStepsTypeAndDifficulty(st,diff) then
                                        local steps = song:GetOneSteps( st, diff );
                                        if PROFILEMAN:IsPersistentProfile(player) then
                                                profile = PROFILEMAN:GetProfile(player);
                                        else
                                                profile = PROFILEMAN:GetMachineProfile();
                                        end;
                                        scorelist = profile:GetHighScoreList(song,steps);
                                        assert(scorelist);
                                        local scores = scorelist:GetHighScores();
                                        assert(scores);
                                        local topscore;
                                        if scores[1] then
                                                topscore = scores[1];
                                                assert(topscore);
                                                local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
                                                local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
                                                local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
                                                local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
                                                local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
                                                local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
                                                self:addx(-31);
                                                self:addy(13.5);
                                                if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                                                        if (greats+perfects) == 0 then
                                                                self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
                                                                self:glowblink();
                                                                self:effectperiod(0.20);
                                                                self:zoom(0.25);
                                                        elseif greats == 0 then
                                                                self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
                                                                self:glowshift();
                                                                self:zoom(0.25);
                                                        elseif (misses+boos+goods) == 0 then
                                                                self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
                                                                self:stopeffect();
                                                                self:zoom(0.25);
                                                        elseif (misses+boos) == 0 then
                                                                self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
                                                                self:stopeffect();
                                                                self:zoom(0.25);
                                                        end;
                                                        self:diffusealpha(0.8);
                                                else
                                                        self:diffusealpha(0);
                                                end;
                                        else
                                                self:diffusealpha(0);
                                        end;
                                else
                                        self:diffusealpha(0);
                                end;
                        end;
                end
                }
        }
 
        return DifficultyListItem
end
 
local t = Def.ActorFrame {
        CodeMessageCommand=function(self,params)
                if params.PlayerNumber == player then
                        if params.Name == "OpenPanes1" and not ThisPlayerPaneIsOpen then
                                self:diffusealpha(1)
                                ThisPlayerPaneIsOpen = true
						elseif params.Name == "OpenPanes2" or params.Name == "OpenPanes3" then
								self:diffusealpha(0);
								ThisPlayerPaneIsOpen = false
								
                        end
                       
                        if params.Name == "ClosePanes" then
                                ThisPlayerPaneIsOpen = false
                                self:diffusealpha(0)
                        end
                end
        end
 
}
 
if not GAMESTATE:IsCourseMode() then
 
        t[#t+1] = LoadActor("DiffFrame.png")..{
                InitCommand=cmd(vertalign,top; zoom,0.7),
                OnCommand=function(self)
                        GetDifListX(self, 35)
                        self:y(_screen.cy-220)
                end,
                OffCommand=function(self)
					if player == PLAYER_1 then
						(cmd(sleep,0.15; linear,0.25; addx,-500))(self);
					elseif player == PLAYER_2 then
						(cmd(sleep,0.15; linear,0.25; addx,500))(self);
					end;
				end;
        }
 
        local difficulties = {"Beginner", "Easy", "Medium", "Hard", "Challenge", "Edit"}
       
        for difficulty in ivalues(difficulties) do
                t[#t+1] = DrawDifListItem("Difficulty_" .. difficulty);
        end
 
        t[#t+1]=Def.ActorFrame {
                InitCommand=cmd(y, 157),
                OffCommand=cmd(zoom,0),
 
                -- Cursor
                Def.Quad{
                        InitCommand=function(self)
								self:draworder(1);
                                GetDifListX(self, 54)
                                self:zoomto(306, 35)
                        end,
                        ["CurrentSteps" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self)
                                self:diffusealpha(0)
                                self:finishtweening()
                                self:diffusealpha(1)
                               
                                local song=GAMESTATE:GetCurrentSong()
                                if song then
 
                                        local steps = GAMESTATE:GetCurrentSteps(player)
                                        if steps then
												
                                                local diff = steps:GetDifficulty();
                                                local st=GAMESTATE:GetCurrentStyle():GetStepsType();
												self:diffuse(CustomDifficultyToColor(diff));
                                                self:y( Difficulty:Reverse()[diff] * 42 )
 
                                        end
                                end
                                end,
                        SaveCommand=function(self)                             
                                -- There's no need to make a custom function to interpret
                                -- StepMania's enums.  The Reverse() method can be applied to any
                                -- enum to do that for you.  That being said...
                                --
                                -- Whatever you're trying to do here, it'll always be nil because
                                -- your "diff" variable is always nil...
                                --
                                -- I would help you more here, but I have no idea what you're attempting.
                                -- So, to temporarily prevent errors, I'm just going to comment this out.
                               
                                -- setenv("SaveDifficulty1P", Difficulty:Reverse()[diff]+1 );
                        end
                }
        }
 
        t[#t+1] = LoadActor("DiffTitles.png")..{
                InitCommand=cmd(vertalign,top; zoom,0.7),
                OnCommand=function(self)
                        GetDifListX(self, 35)
                        self:y(_screen.cy-220)
                end,
				OffCommand=function(self)
					if player == PLAYER_1 then
						(cmd(sleep,0.15; linear,0.25; addx,-500))(self);
					elseif player == PLAYER_2 then
						(cmd(sleep,0.15; linear,0.25; addx,500))(self);
					end;
				end;
        }
end
 
return t