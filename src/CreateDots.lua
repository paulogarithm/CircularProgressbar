local module = function (self: CircularObject)
	if self.Range < 1 then return end;

	local origin = self.Parent.Position + UDim2.new(
		0, self.Parent.Size.X.Offset / 2,
		0, self.Parent.Size.Y.Offset / 2
	)

	for i = 0, self.Range do
		local aplha = (i / self.Range) * math.pi * 2

		local dot = Instance.new("Frame", self.Object)
		dot.Name = tostring(i)
		dot.Size = UDim2.new(0, self.Size, 0, self.Size)
		dot.Position = UDim2.new(
			0, (math.cos(aplha) * self.Space) + origin.X.Offset,
			0, (math.sin(aplha) * self.Space) + origin.Y.Offset
		)
		dot.ZIndex = -i
		local corner = Instance.new("UICorner", dot)
		corner.CornerRadius = UDim.new(1, 0)

	end
end

return module
