package.path = "./?.lua" .. package.path

-- local Object = require "object"

local Bird = require "bird"
print(Bird())

local Crow = require "crow"
print(Crow())
