local max_x = 30269
local max_y = 30307
local max_z = 30323

local function check(x, y, z)
	return x%max_x, y%max_y, z%max_z
end

local function _next(x, y, z)
	x, y, z = check(x*171, y*172, z*170)
	return (x/max_x+y/max_y+z/max_z)%1, x, y, z
end

local function _next_table(t)
	local r, x, y, z = _next(t[1], t[2], t[3])
	return r, {x, y, z}
end

local function _next_table_x(t)
	local r
	r, t[1], t[2], t[3] = _next(t[1], t[2], t[3])
	return r
end

local function modp1(x, y)
	return 1+x%(y-1)
end

local function _new()
	local ts = os.time()
	local x = modp1(ts, max_x)
	local y = modp1(ts, max_y)
	local z = modp1(ts, max_z)
	return x, y, z
end

local function _newtable()
	return {_new()}
end

local function _try_new(x, y, z)
	local x0, y0, z0 = tonumber(x), tonumber(y), tonumber(z)
	local x1, y1, z1 = _new()
	return (x0 or x1), (y0 or y1), (z0 or z1)
end

return {
	next = _next,
	next_table = _next_table,
	next_table_x = _next_table_x,
	max_x = max_x,
	max_y = max_y,
	max_z = max_z,
	max_r = max_r,
	new = _new,
	newtable = _newtable,
	try_new = _try_new,
}
