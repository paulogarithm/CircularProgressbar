local FillModifiers = {}

local Update = require(script.Parent:FindFirstChild('Update'))

local Add = function (self: CircularObject, percentage: number)
	percentage = math.min(math.max(percentage, 0), 100)
	self.Fill += percentage
	self.Fill = math.min(self.Fill, 100)
	Update(self)
end

local Set = function (self: CircularObject, percentage: number)
	percentage = math.min(math.max(percentage, 0), 100)
	self.Fill = percentage
	Update(self)
end

FillModifiers.Add = Add
FillModifiers.Set = Set

return FillModifiers
