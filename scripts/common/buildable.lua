local mod = {
    loadOrder = 1
}

local constructable = mjrequire "common/constructable"
local skill = mjrequire "common/skill"
local snapGroup = mjrequire "common/snapGroup"
local resource = mjrequire "common/resource"
local action = mjrequire "common/action"

function mod:onload(buildable)
    local clearObjectsAndTerrainSequence = {
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.clearTerrain.index
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.bringResources.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.bringTools.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.moveComponents.index,
        },
    }

    buildable:addBuildable("thatchWallDoubleWindow", {
        modelName = "thatchWallDoubleWindow",
        inProgressGameObjectTypeKey = "build_thatchWallDoubleWindow",
        finalGameObjectTypeKey = "thatchWallDoubleWindow",
        name = "Thatch Wall Double Window",
        plural = "Thatch Wall Double Windows",
        summary = "A thatch wall window, but twice as good.",
        classification = constructable.classifications.build.index,

        skills = {
            required = skill.types.thatchBuilding.index,
        },
    
        allowYTranslation = true,
        allowXZRotation = true,

        buildSequence = clearObjectsAndTerrainSequence,

        maleSnapPoints = snapGroup.malePoints.wallMaleSnapPoints,

        requiredResources = {
            {
                type = resource.types.branch.index,
                count = 5,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    durationWithoutSkill = 10.0,
                }
            },
            {
                type = resource.types.hay.index,
                count = 7,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    durationWithoutSkill = 10.0,
                }
            },
        }
    })
end

return mod