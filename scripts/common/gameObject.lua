local mod = {
    loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec2 = mjm.vec2
local normalize = mjm.normalize
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local mat3Inverse = mjm.mat3Inverse

local snapGroup = mjrequire "common/snapGroup"

function mod:onload(gameObject)
    gameObject.gameObjectsTable["thatchWallDoubleWindow"] = {
        modelName = "thatchWallDoubleWindow",
        scale = 1.0,
        hasPhysics = true,
        isBuiltObject = true,
        preventShiftOnTerrainSurfaceModification = true,
        preventGrassAndSnow = true,
        blocksRain = true,
        femaleSnapPoints = snapGroup.femalePoints.standardWallFemaleSnapPoints,
        isPathFindingCollider = true,
        objectViewRotationFunction = function(object) 
            return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
        end,
        objectViewOffsetFunction = function(object)
            return vec3(-0.5,0.0,1.0)
        end,
        markerPositions = {
            { 
                localOffset = vec3(0.0, mj:mToP(1.5), mj:mToP(0.5))
            },
            { 
                localOffset = vec3(0.0, mj:mToP(1.5), mj:mToP(-0.5))
            }
        },
    }

    gameObject.gameObjectsTable["build_thatchWallDoubleWindow"] = {
        modelName = "thatchWallDoubleWindow",
        scale = 1.0,
        hasPhysics = true,
        isInProgressBuildObject = true,
        preventShiftOnTerrainSurfaceModification = true,
        preventGrassAndSnow = true,
        --isPathFindingCollider = true,
        femaleSnapPoints = snapGroup.femalePoints.standardWallFemaleSnapPoints,
        objectViewRotationFunction = function(object) 
            return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
        end,
        objectViewOffsetFunction = function(object)
            return vec3(-0.5,0.0,1.0)
        end,
        markerPositions = {
            { 
                localOffset = vec3(0.0, mj:mToP(1.5), mj:mToP(0.5))
            },
            { 
                localOffset = vec3(0.0, mj:mToP(1.5), mj:mToP(-0.5))
            }
        },
    }
end

return mod