local Object = require "object"

local Bird = Object:extend()

function Bird:_init()
   self.value = "flappy bird"
end

function Bird:fly()
   return "fly"
end

function Bird:__tostring()
   return self.value or "bird"
end

return Bird
