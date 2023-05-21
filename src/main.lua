--] Main Script - by paulogarithm

--> Variables

local CircularModule = {}

local success, s = true, true 
local Update, FillModifiers, CreateDots, Flags


--> Requires

s, Update = pcall(function()
	return require(script:FindFirstChild('Update'))
end)
success = success and s

s, FillModifiers = pcall(function()
	return require(script:FindFirstChild('FillModifiers'))
end)
success = success and s

s, CreateDots = pcall(function()
	return require(script:FindFirstChild('CreateDots'))
end)
success = success and s

s, Flags = pcall(function()
	return require(script:FindFirstChild('Flags'))
end)
success = success and s


--> Types

type CircularColor = {
	Fill: Color3,
	Empty: Color3
}

export type CircularObject = {
	Parent:			Instance,
	Object:			Folder,

	Size: 			number,
	Range:			number,
	Space:			number,

	Fill: 			number,
	CurrentFill:   	number,

	EndFlag:			number?,
	CurrentFlag: 	number,
	
	Visible: 		boolean,
	Colors:			CircularColor,

	Set: 			(self: CircularObject, percentage: number) -> any,
	Add: 			(self: CircularObject, percentage: number) -> any,
	SetColor: 		(self: CircularObject, colors: CircularColor) -> any,

	Flag:			(self: CircularObject) -> any,
	SetEndFlag:		(self: CircularObject) -> any,
}

--> Main

function CircularModule:Create(
	parent:		Instance,
	size: 		number?,
	space: 		number?,
	range: 		number?
): CircularObject?

	local self = {
		Parent 		= parent,
		Size 		= size or 10,
		Space		= space or 50,
		Range		= range or 75,
		Fill 		= 0,
		CurrentFill	= 0,
		Colors		= {
			Fill = Color3.new(.2, .8, .2),
			Empty = Color3.new(1, 1, 1)
		},
		Visible 	= true
	}

	if not success then
		error("CircularModule => Some src files are missing. Returning nil.")
		return
	end

	self.Object = Instance.new("Folder", self.Parent)
	self.Object.Name = "CircularGui"
	self.CurrentFlag = 0

	function self:SetEndFlag(endFlag: number)
		Flags.SetEndFlag(self, endFlag)
	end

	function self:Flag(setFlag: number?)
		Flags.Flag(self, setFlag)
	end

	function self:Add(percentage: number)
		FillModifiers.Add(self, percentage)
	end

	function self:Set(percentage: number)
		FillModifiers.Set(self, percentage)
	end

	function self:SetColor(color: CircularColor)
		self.Colors.Fill = color.Fill or self.Colors.Fill
		self.Colors.Empty = color.Empty or self.Colors.Empty
		Update(self)
	end

	CreateDots(self)
	Update(self)

	return self
end

return CircularModule
