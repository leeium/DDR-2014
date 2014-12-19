-- SN2Score base from waiei by A.C

-- GetTapNoteScore と GetTapNoteScores の違いに気をつける

-- Normal Score
function GetNormalScore(maxsteps,score,player)
	local s;
	local w1 = score:GetTapNoteScore('TapNoteScore_W1');
	local w2 = score:GetTapNoteScore('TapNoteScore_W2');
	local w3 = score:GetTapNoteScore('TapNoteScore_W3');
	local hd = score:GetHoldNoteScore('HoldNoteScore_Held');
	if EXScore(player) == "On" then
		s = w1*3 + w2*2 + w3 + hd*3;
	else
		if PREFSMAN:GetPreference("AllowW1")~="AllowW1_Everywhere" then
			w1 = w1+w2;
			w2 = 0;
		end;
		s = (math.round( (w1 + w2 + w3/2+hd)*100000/maxsteps-(w2 + w3))*10);
	end;
	return s;
end;

-- Normal SN2
function GetSN2Score(player,steps,score)
	local radar = steps:GetRadarValues(player);
	local w1 = score:GetTapNoteScore('TapNoteScore_W1');
	local w2 = score:GetTapNoteScore('TapNoteScore_W2');
	local w3 = score:GetTapNoteScore('TapNoteScore_W3');
	local hd = score:GetHoldNoteScore('HoldNoteScore_Held');
	local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
	if PREFSMAN:GetPreference("AllowW1")~="AllowW1_Everywhere" then
		w1 = w1+w2;
		w2 = 0;
	end;
	return (math.round( (w1 + w2 + w3/2+hd)*100000/maxsteps-(w2 + w3))*10);
end;

-- Evaluation Score
function GetEvaScore(maxsteps,pss,pn)
	local score;
	local w1=pss:GetTapNoteScores('TapNoteScore_W1');
	local w2=pss:GetTapNoteScores('TapNoteScore_W2');
	local w3=pss:GetTapNoteScores('TapNoteScore_W3');
	local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
	if EXScore(pn) == "On" then
		score = w1*3 + w2*2 + w3 + hd*3;
	else
		if PREFSMAN:GetPreference("AllowW1")~="AllowW1_Everywhere" then
			w1=w1+w2;
			w2=0;
		end;
		score = (math.round( (w1 + w2 + w3/2+hd)*100000/maxsteps-(w2 + w3))*10);
	end;
	return score;
end;

-- Gameplay SN2
function ChangeSN2Score(params,steps)
	local player = params.Player;
	local ret = 0;
	local rv = steps:GetRadarValues(player);
	local maxsteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')
		+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
	local w1 = pss:GetTapNoteScores('TapNoteScore_W1');
	local w2 = pss:GetTapNoteScores('TapNoteScore_W2');
	local w3 = pss:GetTapNoteScores('TapNoteScore_W3');
	local hd = pss:GetHoldNoteScores('HoldNoteScore_Held');
	if params.HoldNoteScore == 'HoldNoteScore_Held' then
		hd = hd+1;
	elseif params.TapNoteScore == 'TapNoteScore_W1' then
		w1 = w1+1;
	elseif params.TapNoteScore == 'TapNoteScore_W2' then
		w2 = w2+1;
	elseif params.TapNoteScore == 'TapNoteScore_W3' then
		w3 = w3+1;
	end;
	ret=(math.round((w1 + w2 + w3/2 + hd) *100000/maxsteps-(w2 + w3))*10);
	return ret;
end;

-- Gameplay EX
function ChangeEXScore(params)
	local player = params.Player;
	local ret = 0;
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
	local w1 = pss:GetTapNoteScores('TapNoteScore_W1');
	local w2 = pss:GetTapNoteScores('TapNoteScore_W2');
	local w3 = pss:GetTapNoteScores('TapNoteScore_W3');
	local hd = pss:GetHoldNoteScores('HoldNoteScore_Held');
	if params.HoldNoteScore == 'HoldNoteScore_Held' then
		hd = hd+1;
	elseif params.TapNoteScore == 'TapNoteScore_W1' then
		w1 = w1+1;
	elseif params.TapNoteScore == 'TapNoteScore_W2' then
		w2 = w2+1;
	elseif params.TapNoteScore == 'TapNoteScore_W3' then
		w3 = w3+1;
	end;
	ret = w1*3 + w2*2 + w3*1 + hd*3;
	return ret;
end;

-- Course Gameplay (CutIn)
function ChangeCourseSN2Score(pss)
	local w1 = pss:GetTapNoteScores('TapNoteScore_W1');
	local w2 = pss:GetTapNoteScores('TapNoteScore_W2');
	local w3 = pss:GetTapNoteScores('TapNoteScore_W3');
	local hd = pss:GetHoldNoteScores('HoldNoteScore_Held');
	local maxsteps = getenv("SaveAllNote");
	if PREFSMAN:GetPreference("AllowW1")~="AllowW1_Everywhere" then
		w1 = w1+w2;
		w2 = 0;
	end;
	return (math.round( (w1 + w2 + w3/2+hd)*100000/maxsteps-(w2 + w3))*10);
end;

--[[
function NormalScore_SM5b1(params,steps)
	local pn=params.Player;
	local ret=0;
	local rv=steps:GetRadarValues(pn);
	local pss=STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
	local maxsteps=math.max(rv:GetValue('RadarCategory_TapsAndHolds')
		+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
	local w1=pss:GetTapNoteScores('TapNoteScore_W1');
	local w2=pss:GetTapNoteScores('TapNoteScore_W2');
	local w3=pss:GetTapNoteScores('TapNoteScore_W3');
	local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
	local minus=0;	-- [ja] b1では強制でデフォルトスコア計算の値が加算されるのでマイナスする 
	if params.HoldNoteScore=='HoldNoteScore_Held' then
		hd=hd+1;
		minus=5;
	elseif params.HoldNoteScore=='HoldNoteScore_LetGo' then
		minus=0;
	elseif params.TapNoteScore=='TapNoteScore_W1' then
		w1=w1+1;
		minus=5;
	elseif params.TapNoteScore=='TapNoteScore_W2' then
		w2=w2+1;
		minus=4;
	elseif params.TapNoteScore=='TapNoteScore_W3' then
		w3=w3+1;
		minus=3;
	elseif params.TapNoteScore=='TapNoteScore_W4' then
		minus=2;
	elseif params.TapNoteScore=='TapNoteScore_W5' then
		minus=1;
	end;
	ret=(math.round((w1 + w2 + w3/2 + hd) *100000/maxsteps-(w2 + w3))*10)-minus;
--	pss:SetScore(ret);
	return;
end;
--]]

-- 基本点用 (出来るだけ解説を加えてみた)
function kihonten()
	local mpn = GAMESTATE:GetMasterPlayerNumber();
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	local trail = GAMESTATE:GetCurrentTrail(mpn)
	-- コースの個別ステージを呼び出すためのもの
	local entries = trail:GetTrailEntries()
	-- コースの全体のステージ数を呼び出す
	local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
	local alldp = 0;
	local allnote = 0;
	--　ステージ1から最終ステージまでループさせて、全体のポイントを出す
	for i = 1, coursestages do
		local song = entries[i];
		-- Challengeの自動作成コース(アーティストくくり)でsongをnilで返すことがあるバグを対処しておく、バグが発生するとスコア計算もステージ数でズレる
		if song ~= nil then
			local diff = song:GetSteps():GetDifficulty()
			local onestep = song:GetSong():GetOneSteps(st,diff)
			local rv = onestep:GetRadarValues(mpn);
			--　ノート数＋フリーズアロー数を呼び出す
			local note = math.max(rv:GetValue('RadarCategory_TapsAndHolds')+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
			-- 総ノート数を加算しておく、基本点には関係ないが後で必要
			allnote = allnote + note
			local stage;
			-- ステージ数が奇数が偶数か判別する、下の項目で必要になる
			if i % 2 == 0 then
				-- 偶数の場合はそのまま
				stage = i;
			else
				-- 奇数の場合は+1
				stage = i+1;
			end
			-- 各ステージでダンスポイントを算出するための数値が違うので、それを叩き出す。
			local point = (-1*stage/2)+2+stage
			--　各ステージごとによるポイントを算出
			local dancepoint = note*point
			-- ポイントを加算していく
			alldp = alldp + dancepoint
		end;
	end
	-- マーベラスフルコンボの為に総ノート数を記録する
	setenv("SaveAllNote",allnote);
	--　ポイントの基本点を出す
	local last = 1000000/alldp;
	return last
end;

-- Course Score
--[[
function CourseScore_SM5b1(params,bkihonten,csall,bSaveAllNote)
	local pn=params.Player;
	local pss=STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
	local score = pss:GetScore();
	local minus=0;	-- [ja] b1では強制でデフォルトスコア計算の値が加算されるのでマイナスする 
	local stage;
	if csall % 2 == 0 then
		stage = csall;
	else
		stage = csall+1;
	end
	local level = (-1*stage/2)+2+stage
	local w1=pss:GetTapNoteScores('TapNoteScore_W1');
	local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
	if params.HoldNoteScore=='HoldNoteScore_Held' then
		score = score + (bkihonten * level);
		hd=hd+1;
		minus=5;
	elseif params.HoldNoteScore=='HoldNoteScore_LetGo' then
		minus=0;
	elseif params.TapNoteScore=='TapNoteScore_W1' then
		w1=w1+1;
		score = score + (bkihonten * level);
		minus=5;
	elseif params.TapNoteScore=='TapNoteScore_W2' then
		score = score + (bkihonten * (level-1));
		minus=4;
	elseif params.TapNoteScore=='TapNoteScore_W3' then
		score = score + (bkihonten * (level-2));
		minus=3;
	elseif params.TapNoteScore=='TapNoteScore_W4' then
		minus=2;
	elseif params.TapNoteScore=='TapNoteScore_W5' then
		minus=1;
	end;
	-- もしマーベラスフルコンボだった場合、小数点の関係かギリギリ満点にならないことが多いためこうする
	--　なおコース全体から総ノート数を呼び出すと普段は問題ないが、コースがランダム時にはまともな数値が出ないため機能しなくなる、なので実際に計測してこんな感じに
	if w1+hd == bSaveAllNote then --
	--	pss:SetScore(1000000 - minus);
	else
	--	pss:SetScore(score-minus);
	end;
	return;
end;
--]]