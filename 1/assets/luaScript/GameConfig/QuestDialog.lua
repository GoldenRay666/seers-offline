--package.path = package.path .. ';../../GameConfigForLua/?.lua'
--package.path = package.path .. ';../GameConfigForLua/?.lua'

--require("QuestDialogConfig")

function getQuestDialogContent(dialogId)
	return QuestDialog[dialogId]['content']
end

function getQuestDialogNextDialogID(dialogId)
	return QuestDialog[dialogId]['nextDialogID']
end

function getQuestDialogNpcID(dialogId)
	return QuestDialog[dialogId]['npcID']
end

function getQuestDialogFaceID(dialogId)
	return QuestDialog[dialogId]['faceID']
end

function getSkillName(skillId)
	return SkillText[skillId]['name']
end

function getSkillDesc(skillId)
	return SkillDesc[skillId]['des']
end

function getBuffName(buffId)
	return BuffName[buffId]['name']
end

function getAeraName(aeraId)
	return AeraName[aeraId]['name']
end

function getHideSkillDesc(skillId)
	return HideSkillDesc[skillId]['desc']
end

function getMonsterDefName(monsterId)
	return MonsterDefName[monsterId]['name']
end

function getFeatureName(featureId)
	return FeatureInfo[featureId]['name']
end

function getFeatureDesc(featureId)
	return FeatureInfo[featureId]['desc']
end

function getPetFoundin(petId)
	return PetTextInfo[petId]['foundin']
end

function getPetIntro(petId)
	return PetTextInfo[petId]['intro']
end

function getPetType(petId)
	return PetTextInfo[petId]['petType']
end

function getPetFeature(petId)
	return PetTextInfo[petId]['feature']
end

--print(getQuestDialogFaceID(1200))


