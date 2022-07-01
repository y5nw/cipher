local S = require "shift"
local sub = string.sub
local lookup = {}
local strings = {
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	"abcdefghijklmnopqrstuvwxyz",
}
for offset = 0, 25 do
	local t = {}
	lookup[offset] = t
	for _, str in pairs(strings) do
		local len = #str
		for i = 1, len do
			local cur = i
			local nxt = (i-1+offset)%26+1
			t[sub(str, cur, cur)] = sub(str, nxt, nxt)
		end
	end
end

local t = S.mkfuncs(lookup, 26)
return t
