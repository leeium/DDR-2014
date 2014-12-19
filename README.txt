################################################################
\\\\\\\\\\\\\\\\\\\\\\\\\\\\INFO\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
################################################################
Welcome to the Alpha version of the DDR 2014 (1280x720) theme for 
Stepmania 5. we have tried to make it as accurate as possible using 
recreated graphics, sounds and coding. 

Known errors/bugs/issues:
- Difficulty lists in ScreenSelectMusic return errors for not 
  being able to index local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();

- Full Combo ring won't appear on the main grade display in 
  ScreenSelectMusic so I removed it, the grade is still there.

- MusicWheel difficulty display. I still can't figure out how to
  display only the selected difficulty so for now it's the hardest
  difficulty.

Coming soon:
- eAmuse(ish) system. I have the ideas, just not the coding 
  know-how.
- Cut-ins. It's not 100% necessary but it'll be there.
- Target score, should I ever figure out how to do it.
- FIXED ERRORS! 

Anywho, Enjoy and feel free to modify.	

Notes:
- Some elements are only temporary until I learn how to code
  them. These elements include:
	- ScreenSortList: From dbk2's Simply Love port/Kyzentun's
	  Consensual theme.
	- The cursor for Difficulty lists in ScreenSelectMusic:
	  From G2008 & strider's DDR 2013 theme.

################################################################
\\\\\\\\\\\\\\\\\\\\\\\\\\\\CODES\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
################################################################
ScreenSelectMusic:
	To open/use Information Panes - *On the dancepad* [Left+Up, Right+Up, Left+Down]
	To close Information Panes - *On the dancepad* [Right+Down]
	To access options - [Select]
	To access shortcut menu - [Left+Right]
	To access sort wheel - *On the dancepad* [Up,Down,Up,Down]

ScreenEvaluation:
	To use Information Panes - [Use Left, Up, Right or Down on the dance pad]

################################################################
\\\\\\\\\\\\\\\\\\\\\SUGGESTED SETTINGS\\\\\\\\\\\\\\\\\\\\\\\\\
################################################################
Codes:
For more efficient use of these codes make sure to have 
      [MenuDown] and [Down] mapped to different keys and 
      [MenuUp] and [Up] mapped to different keys.
		Example for P1: Left  = [G]	MenuLeft  = [LEFT]	Select  = [/]
			 	Down  = [H]	MenuDown  = [DOWN]	Confirm = [ENTER]
			 	Up    = [Y]	MenuUp    = [UP]
			 	Right = [J]     MenuRight = [RIGHT]

		Example for P2: Left  = [K]	MenuLeft  = [KP4]	Select  = [KP0]
			 	Down  = [L]	MenuDown  = [KP2]	Confirm = [KPENTER]
			 	Up    = [O]	MenuUp    = [KP8]
			 	Right = [:]     MenuRight = [KP6]

Groups:
For the group title and colours to work in ScreenSelectMusic
some renaming of folders is necessary (this is to make a 
logical order of DDR mixes). The following are the original and
renamed song packs, all from www.Zenius-i-vanisher.com plus
DDR Next Generation:
- DanceDanceRevolution 1stMIX
- DanceDanceRevolution 2ndMIX
- DanceDanceRevolution 3rdMIX
- DanceDanceRevolution 4thMIX
- DanceDanceRevolution 5thMIX
- DanceDanceRevolution 6thMIX MAX
- DanceDanceRevolution 7thMIX MAX2
- DanceDanceRevolution 8thMIX EXTREME
- DanceDanceRevolution SuperNOVA
- DanceDanceRevolution SuperNOVA2
- DanceDanceRevolution X
- DanceDanceRevolution X2
- DanceDanceRevolution X3 (now also works for DanceDanceRevolution X3 vs. 2ndMIX)
- DDR 2013
- DDR 2014

################################################################
\\\\\\\\\\\\\\\\\\CREDITS & ACKNOWLEDGMENTS\\\\\\\\\\\\\\\\\\\\\
################################################################
G2008 & strider: Authors of DDR2013 theme for Stepmania 5. Gene
asked me to do this theme.

Pkwp: In charge of graphics and arcade accuracy.

Everyone in the forums who helped by sending in audio/graphics and offered advice.