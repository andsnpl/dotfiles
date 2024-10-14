-- Lua compatibility fix
table.unpack = table.unpack or unpack

require("paul.core")
require("paul.lazy")
