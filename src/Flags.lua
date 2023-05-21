local module = {}

local Update = require(script.Parent:FindFirstChild('Update'))

module.Flag = function (self: CircularObject, setFlag: number?)
	if not self.EndFlag then
		return error("CircularModule => Can not set flag : no EndFlag given.")
	end

	self.CurrentFlag = setFlag or self.CurrentFlag + 1

	if self.CurrentFlag > self.EndFlag then
		warn("" ..
			"CircularModule => " ..
			string.format("The CurrentFlag (%d) ", self.CurrentFlag) ..
			"is greater than " ..
			string.format("EndFlag (%d) : ", self.EndFlag) ..
			"capped the progress to 100%%."
		)
	end
	self.CurrentFlag = math.min(self.CurrentFlag, self.EndFlag)
	self.Fill = (self.CurrentFlag / self.EndFlag) * 100
	Update(self)
end

module.SetEndFlag = function (self: CircularObject, endFlag: number)
	if endFlag < 0 then
		return error("CircularModule => Can not use a negative flag.")
	end
	self.EndFlag = endFlag
end

return module
