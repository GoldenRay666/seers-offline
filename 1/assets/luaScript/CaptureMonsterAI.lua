require("CaptureMonster")

local kMONSTER_STATE_COMING = 0		-- come on the stage, playing the come-on effect
local kMONSTER_STATE_ACTING = 1		-- active state, executing the AI
local kMONSTER_STATE_TRAPPED = 2	-- be captured, playing the trap effect

local kSKILL_TYPE_ATTACK = 0
local kSKILL_TYPE_AID = 1

local kMonster_IDLE_STATE = 0
local kMonster_MOVE_STATE = 1
local kMonster_ATTACK_STATE = 2
local kMonster_JUMP_STATE = 3

local kSkillEffectRecover = 1

local kCaptureSkillRangeNone = 0
local kCaptureSkillRangeLine = 1
local kCaptureSkillRangeFan = 2
local kCaptureSkillRangeCircle = 3
local kCaptureSkillRangeCrash = 4
local kCaptureSkillRangeFullScreen = 5

local kCurrentRoundCount = 0
local kCurrentActionStage = 1
local kCurrentMonsterState = -1

function canAttack()
	ret = false

	if kCurrentRoundCount > 0 and kMonsterAiStage["useSkillRoundInterval"] > 0 then
		if kCurrentRoundCount % kMonsterAiStage["useSkillRoundInterval"] == 0 then
			ret = true
		end
	end

	return ret
end

function monsterUseSkill()
	prob = math.random(0, 99)

	for i = 1, #kMonsterAiSkills do
		local skillInfo = kMonsterAiSkills[i]

		if skillInfo["skillType"] == kSKILL_TYPE_ATTACK then
			if prob < skillInfo["ratio"] then
				CaptureMonster.prepareUseSkill()


				if skillInfo["effectType"] == kSkillEffectRecover then
					CaptureMonster.saveHp(skillInfo["effectParam"])
					CaptureMonster.treatedAnimation(i - 1)
					CaptureMonster.idle(2.0)
					kCurrentActionStage = 1
				elseif skillInfo["rangeType"] == kCaptureSkillRangeCrash then
					CaptureMonster.moveAndUseSkill(true, i - 1)

					kCurrentActionStage = 1
				else
					CaptureMonster.noramlAttack(i - 1)

					kCurrentActionStage = 1
				end

				break
			else
				prob = prob - skillInfo["ratio"]
			end
		end
	end
end

function canJump()
	ret = false

	prob = math.random(0, 99)

	if kCurrentActionStage == 3 then
		if kMonsterAiStage["jumpRatio"] > 0 and prob < 50 then
			ret = true
		end
	else
		if prob >= kMonsterAiStage["moveRatio"] then
			jumpRatio = kMonsterAiStage["moveRatio"] + kMonsterAiStage["jumpRatio"]
			if prob < jumpRatio then
				ret = true
			end
		end
	end

	return ret
end

function monsterJump()
	CaptureMonster.jump()
	kCurrentActionStage = kCurrentActionStage + 1
end

function canIdle()
	ret = false

	prob = math.random(0, 99)
	if kCurrentActionStage > 1 then
		if prob < 50 then
			ret = true
		end
	else
		if kCurrentActionStage == 3 then
			if kMonsterAiStage["jumpRatio"] <= 0 or prob > 50 then
				ret = true
			end
		end
	end

	return ret
end

function monsterIdle()
	CaptureMonster.idle(2.0)
	kCurrentActionStage = 1
end

function canMove()
	return true
end

function monsterMove()
    local totalRatio = kMonsterAiStage["moveRatio"] + kMonsterAiStage["rushRatio"]
	prob = math.random(0, totalRatio - 1)

	if prob < kMonsterAiStage["moveRatio"] then
		CaptureMonster.move(false)
	else
		CaptureMonster.move(true)
	end

	kCurrentActionStage = kCurrentActionStage + 1
end

local kMonsterFMS = {
	attack = {
		cond = {
			{func = canAttack, params = 1},
		},

		enter = {
			func = monsterUseSkill,
			params = nil,
		},
	},

	jump = {
		cond = {
			{func = canJump, params = 1},
		},

		enter = {
			func = monsterJump,
			params = nil,
		},
	},

	idle = {
		cond = {
			{func = canIdle, params = 1},
		},

		enter = {
			func = monsterIdle,
			params = nil,
		},
	},

	move = {
		cond = {
			{func = canMove, params = 1},
		},

		enter = {
			func = monsterMove,
			params = nil,
		},
	},
}


function enter()
	kCurrentMonsterState = kMonster_IDLE_STATE

	while true do
		--print("update update")
		update(kMonster_IDLE_STATE, kCurrentRoundCount, {"attack", "idle", "jump", "move"})
		kCurrentRoundCount = kCurrentRoundCount + 1

		if kCurrentActionStage > 3 then
			kCurrentActionStage = 1
		end
	end
end

function update(lastMonsterState, currentRoundCount, canTranslatedStates)
	for i = 1, #canTranslatedStates do
		stateName = canTranslatedStates[i]

		local condRet = true

		stateInfo = kMonsterFMS[stateName]
		for j = 1, #stateInfo["cond"] do
			funcInfo = stateInfo["cond"][j]
			if not funcInfo["func"]() then
				condRet = false
				break
			end
		end

		if condRet then
			enterFunc = stateInfo["enter"]["func"]
			enterFunc()
		end
	end
end













