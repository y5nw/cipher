local R = require "wichmann-hill"
local x, y, z = R.try_new(arg[1], arg[2], arg[3])
local write = io.write()
write(string.format("Offsets: %d, %d, %d\n--- Message ---\n", x, y, z)
