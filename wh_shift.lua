local R = require "wichmann-hill"
local M = require "charmap94"
local C = require "char"

local function _next(x, y, z)
	local r, x, y, z = R.next(x, y, z)
	return math.floor(r*94), x, y, z
end

local function shift(str, x, y, z)
	local buf = {}
	local r
	x, y, z = R.try_new(x, y, z)
	for i, c in C.chars(str) do
		r, x, y, z = _next(x, y, z)
		buf[i] = M.shiftchar(c, r)
	end
	return table.concat(buf)
end

local function unshift(str, x, y, z)
	local buf = {}
	local r
	x, y, z = R.try_new(x, y, z)
	for i, c in C.chars(str) do
		r, x, y, z = _next(x, y, z)
		buf[i] = M.unshiftchar(c, r)
	end
	return table.concat(buf)
end

return {
	shift = shift,
	unshift = unshift,
}
