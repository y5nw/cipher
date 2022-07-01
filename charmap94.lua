local S = require "shift"

local chars = {}
for i = 33, 126 do
	chars[#chars+1] = string.char(i)
end
chars = table.concat(chars)
local charcount = #chars
--print(chars, #chars)

local charmap = {}
for i = 0, charcount-1 do
	local t = {}
	charmap[i] = t
	for j = 1, charcount do
		local cur = j
		local nxt = (j-1+i)%charcount+1
		t[string.sub(chars, cur, cur)] = string.sub(chars, nxt, nxt)
	end
end

local t = S.mkfuncs(charmap, charcount)
t.chars = chars
return t
