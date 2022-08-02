-- local mod = {
--     loadOrder = 1
-- }

-- local constructable = mjrequire "common/constructable"

-- function mod:onload(buildUI)
--     local superCreateItemList = buildUI.createItemList

--     buildUI.createItemList = function(self)
--         superCreateItemList(buildUI)

--         local found = false

--         for index, item in ipairs(buildUI.itemList) do
--             if item == constructable.types.thatchWallLargeWindow.index then
--                 table.insert(buildUI.itemList, index + 1, constructable.types.thatchWallDoubleWindow.index)
--                 found = true
--                 break
--             end
--         end

--         if found == false then
--             table.insert(buildUI.itemList, constructable.types.thatchWallDoubleWindow.index)
--         end
--     end
-- end

-- return mod

--sorry about this mess, this is compiled from moonscript
local mod = {
    loadOrder = 1,
    onload = function(self, buildUI)
      local constructable = mjrequire("common/constructable")
      return (function(shadow)
        buildUI.createItemList = function()
          shadow()
          local found = false
          for index, item in ipairs(buildUI.itemList) do
            if item == constructable.types.thatchWallLargeWindow.index then
              table.insert(buildUI.itemList, index + 1, constructable.types.thatchWallDoubleWindow.index)
              found = true
              break
            end
          end
          if not (found) then
            return table.insert(buildUI.itemList, constructable.types.thatchWallDoubleWindow.index)
          end
        end
      end)(buildUI.createItemList)
    end
  }
  return mod  