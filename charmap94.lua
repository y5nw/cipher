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

local function shift(str, offset)
	offset = math.floor(tonumber(offset) or 0) % charcount
	return string.gsub(str, ".", charmap[offset])
end

local function unshift(str, offset)
	return shift(str, -offset)
end

local function shiftchar(char, offset)
	offset = math.floor(tonumber(offset) or 0) % charcount
	return charmap[offset][char] or char
end

local function unshiftchar(char, offset)
	return shiftchar(char, -offset)
end

--[[
for i = 0, charcount-1 do
	print(i, shift(chars, i))
end
]]

return {
	chars = chars,
	nchars = nchars,
	shift = shift,
	unshift = unshift,
	shiftchar = shiftchar,
	unshiftchar = unshiftchar,
}
