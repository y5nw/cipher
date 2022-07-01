local R = require "wichmann-hill"
local S = require "wh_shift"

local x, y, z = R.try_new(arg[1], arg[2], arg[3])
io.write(string.format("Seed: %d, %d, %d\n", x, y, z))
io.write(S.shift(io.read("*a"), x, y, z))
