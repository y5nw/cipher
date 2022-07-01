local shift_one
do
	local lookup = {}
	local strings = {
		"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		"abcdefghijklmnopqrstuvwxyz",
	}
	local sub = string.sub
	for _, str in pairs(strings) do
		local len = #str
		for i = 1, len do
			local cur = i
			local nxt = i%len+1
			lookup[sub(str, cur, cur)] = sub(str, nxt, nxt)
		end
	end
	local gsub = string.gsub
	local match = string.format("([%s])", table.concat(strings))
	shift_one = function(str)
		return gsub(str, match, lookup)
	end
end

local offset = tonumber(arg[1])

local str = io.read("*a")
if offset then
	for i = 1, offset%26 do
		str = shift_one(str)
	end
	io.write(str)
else
	for i = 1, 25 do
		str = shift_one(str)
		io.write(string.format("%d (%d): %s\n", i, i-26, str))
	end
end
