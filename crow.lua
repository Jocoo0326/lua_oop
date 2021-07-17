local Bird = require "bird"

local Crow = Bird:extend()

function Crow:__tostring()
   return "crow bird"
end

return Crow
