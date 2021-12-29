-- This is an API intended to be loaded with os.loadAPI()
-- Turtle state API
-- In the best case, this allows us to preserve state through server
-- crashes, chunks loading/unloading, etc. via saving state to file
--

--[[
to load or initialize a value:

tState:load(label) or tState.label = value


to get value:

tState.label


to save value:

tState:save(label) or tState:save(label, data)

]]

save = function(self, label, data) do
	self[label] = data or self[label]
	local file = io.open("/ComputerCraft/data/"..label, "w")
	file.write(textutils.serialize(self[label]))
	file.close()
	return self[label]
end

load = function(self, label) do
	local file = io.open("/ComputerCraft/data/"..label, "r")
	-- if not file return nil end
	self[label] = textutils.unserialize(file.read("a"))
	file.close()
	return self[label]
end
