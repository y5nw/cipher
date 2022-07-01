local S = require "caesar-shift"
local offset = tonumber(arg[1])

local str = io.read("*a")
if offset then
	local str = S.shift(str, offset)
	io.write(str)
else
	for i = 1, 25 do
		io.write(string.format("%d (%d): %s\n", i, i-26, S.shift(str, i)))
	end
end
