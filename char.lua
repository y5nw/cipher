local function _next(str, idx)
	if idx >= #str then
		return nil
	end
	local newidx = idx + 1
	return newidx, (string.sub(str, newidx, newidx))
end

local function chars(str)
	return _next, str, 0
end

return {
	chars = chars,
}
