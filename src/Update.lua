local tweenService = game:GetService "TweenService"

local Step = function (self: CircularObject)
	local percent = self.CurrentFill / 100
	local goto = math.floor(percent * self.Range)

	for i = 0, self.Range do
		local object = self.Object:FindFirstChild(tostring(i))

		if not object then continue end
		if object.ClassName ~= "Frame" then return end
		if i < goto then
			object.BackgroundColor3 = self.Colors.Fill
			continue
		end
		object.BackgroundColor3 = self.Colors.Empty
	end
end

local Update = function (self: CircularObject)
	local tmpValue = Instance.new("NumberValue")
	tmpValue.Value = self.CurrentFill
	
	tmpValue:GetPropertyChangedSignal('Value'):Connect(function(...)
		self.CurrentFill = tmpValue.Value
		Step(self)
	end)

	local tweenInfo = TweenInfo.new(
		.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In
	)
	local tween = tweenService:Create(tmpValue, tweenInfo, {
		Value = self.Fill
	})
	tween:Play()
	tween.Completed:Wait()
	
	self.CurrentFill = self.Fill
end

return Update
