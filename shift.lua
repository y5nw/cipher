local function mkfuncs(map, nchars)
	local floor = math.floor
	local gsub = string.gsub
	local tonumber = tonumber
	local function getoffset(x)
		return floor(tonumber(x) or 0) % nchars
	end
	local function unoffset(x)
		return (-floor(tonumber(x) or 0)) % nchars
	end
	local function shift(str, offset)
		return gsub(str, ".", map[getoffset(offset)])
	end
	local function unshift(str, offset)
		return gsub(str, ".", map[unoffset(offset)])
	end
	local function shiftchar(char, offset)
		return map[getoffset(offset)][char] or char
	end
	local function unshiftchar(char, offset)
		return map[unoffset(offset)][char] or char
	end
	return {
		nchars = nchars,
		shift = shift,
		unshift = unshift,
		shiftchar = shiftchar,
		unshiftchar = unshiftchar,
	}
end

return {
	mkfuncs = mkfuncs,
}
