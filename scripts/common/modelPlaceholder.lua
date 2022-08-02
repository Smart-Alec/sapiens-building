--For Dave:
--expose getRemaps
--expose various remaps
--expose getModelIndexForStandardRemaps

local mod = {
    loadOrder = 1
}

local resource = mjrequire "common/resource"
local flora = mjrequire "common/flora"
local gameObject = mjrequire "common/gameObject"
local model = mjrequire "common/model"

function mod:onload(modelPlaceholder)
    local function getRemaps(key)
        return {
            model:modelIndexForModelNameAndDetailLevel(key, 1),
            model:modelIndexForModelNameAndDetailLevel(key, 2),
            model:modelIndexForModelNameAndDetailLevel(key, 3),
            model:modelIndexForModelNameAndDetailLevel(key, 4)
        }
    end

    local function getModelIndexForStandardRemaps(placeholderInfo, remaps, placeholderContext)
        if remaps then
            local remap = remaps[model:modelLevelForSubdivLevel(placeholderContext.subdivLevel)]
            if remap then
                return remap
            end
        end
        return placeholderInfo.defaultModelIndex
    end

    local temporaryLongBranchRemaps = {} --I need Dave to expose these better
    --local halfBranchRemaps = {}
    --local shortPoleBranchRemaps = {}
    --local standardLengthPoleBranchRemaps = {}

    for i, baseKey in ipairs(flora.branchTypeBaseKeys) do
        local baseGameObjectTypeIndex = gameObject.types[baseKey .. "Branch"].index

        temporaryLongBranchRemaps[baseGameObjectTypeIndex] = getRemaps(baseKey .. "BranchLong")
        --halfBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps(baseKey .. "BranchHalf")
        --standardLengthPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPole_" .. baseKey)
        --shortPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPoleShort_" .. baseKey)
    
        --burntFuelRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("birchBranchBurnt")
    end

    modelPlaceholder:addModel("thatchWallDoubleWindow", {
        { 
            multiKeyBase = "branch",
            multiCount = 5, 
            defaultModelName = "branchLong",
            resourceTypeIndex = resource.types.branch.index,
            hiddenOnBuildComplete = true,
            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                if placeholderContext and placeholderContext.buildComplete then
                    return nil
                end
                return getModelIndexForStandardRemaps(placeholderInfo, temporaryLongBranchRemaps[objectTypeIndex], placeholderContext)
            end
        },
        {
            key = "hay_1",
            defaultModelName = "thatchWideShort",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_2",
            defaultModelName = "thatchWideShort",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_3",
            defaultModelName = "thatchSectionTall_100",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_4",
            defaultModelName = "thatchSectionTall_100",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_5",
            defaultModelName = "thatchSectionTall_100",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_6",
            defaultModelName = "thatchWideShort",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
        {
            key = "hay_7",
            defaultModelName = "thatchWideShort",
            resourceTypeIndex = resource.types.hay.index,
            defaultModelShouldOverrideResourceObject = true,
        },
    
        {
            key = "branch_store",
            offsetToStorageBoxWalkableHeight = true,
        },
        {
            key = "hay_store",
            offsetToStorageBoxWalkableHeight = true,
        },
    })
end

return mod