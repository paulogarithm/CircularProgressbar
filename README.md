<h1 align='center'>
  CircularProgressbar
</h1>
Circular Progressbar Module for Roblox Studio.

## How to get it ?

### > Toolbox method
- Obtain the module in roblox by clicking [<b>Here</b>](https://www.roblox.com/library/13513052096/Circular-Progressbar-Module).
- In Roblox Studio, click on `HOME` at the top, then `ToolBox`.
- Open your inventory (The 4 little boxes).
- Click on `Circular Progressbar`.

### > File Method
- Download the [CircularPrigressbar.rbxm](https://github.com/paulogarithm/CircularProgressbar/blob/main/CircularProgressbar.rbxm) File.
- In Roblox Studio, do a right click in the Explorer.
- Click on `Insert from File...`.
- Select the .rbxm file just downloaded.

## How to use it ?

### > Import the module

To import the module, you'll need to `require` the Module Script from another script, using the [Roblox Parenting System](https://create.roblox.com/docs/education/coding-1/parents-and-children). <br>
For example, if you drag the Module inside of your script, you should have a parenting tree like this :
```
LocalScript
 |
 +-- CircularModule
      |
      ...
```
Now that your circluar module is somewhere accessible for your script, you can require your script :
```lua
--> In the example tree above, the CircularModule is the child of my script.

local Module = require(script:FindFirstChild('CircularModule'))

...
```

<br>

### > `Module:Create`

Now that the Module is created, we can use the `Module:Create` function to create Circle Object. The Circle Object is basically the object for the progress bar you can manipulate individually.
```lua
local Module = require(script:FindFirstChild('CircularModule'))

local progressBar = Module:Create(...)
```

The `Module:Create` function Takes 3 parametters

| Name    | Type     | Optionnal & Default Value |
|---------|----------|---------------------------|
| parent  | Instance | no                        |
| size    | number   | yes (10 by default)       |
| space   | number   | yes (50 by default)       |
| range   | number   | yes (75 by default)       |


- `parent`: The parent of the ProgressBar. It will be at the center of it. It can be any Gui Object such as a Frame, a TextLabel...
- `size`: The size of the ring's circle. The higher the number is, the bigger then ring is.
- `space`: The radius of the circle. It's the space between all dots of the circle.
- `range`: The precision of the circle. It's the number of dots, so the higher number = higher resolution (but it means more dots, so less performances).

<br>

After creating the progressBar, you now have a `CirclarObject`.

<br><br>

### > CirclarObject

Here is the CircularObject official type values :
```ts
type CircularObject = {
	Parent:         Instance,
	Object:         Folder,

	Size:           number,
	Range:          number,
	Space:          number,

	Fill:           number,
	CurrentFill:    number,

	EndFlag:        number?,
	CurrentFlag:    number,
	
	Visible:        boolean,
	Colors:         CircularColor,

	Set:            (self: CircularObject, percentage: number) -> any,
	Add:            (self: CircularObject, percentage: number) -> any,
	SetColor:       (self: CircularObject, colors: CircularColor) -> any,

	Flag:           (self: CircularObject) -> any,
	SetEndFlag:     (self: CircularObject) -> any,
}
```

<br>

## The Documentation Functions

### > `Object:SetColors({Fill: Color3, Empty: Color3})`

The `Object:SetColors` function takes one parametter, which is a dictionnay that contains `Parametter.Fill` and `Parametter.Empty`, which are bother Color3 values. <br>
By default, the Fill value will be set to Green (#33cc33) and the empty to White (#ffffff)

Here is an example on how to set your custom colors :
```lua
--> For Red fill with Black background
progressBar:SetColors({
  Fill = Color3.fromRGB(255, 0, 0),
  Empty = Color3.fromRGB(0, 0, 0)
})

--> Change the Red to Green
progressBar:SetColors({
  Empty = Color3.fromRGB(0, 255, 0)
})
```

<br>

### > `Object:Set(number)`

Sets the ProgressBar to the number given in parametter of percentage. <br>
If the Set it to big, it will be set to 100. If it's bellow 0, it will be set to 0. <br>

```lua
progressBar:Set(50) 	--> Fill the circle to 50%
progressBar:Set(3)	--> Fill the circle to 3%
```

<br>

### > `Object:Add(number)`

Adds a percentage to the one already completed.

```lua
progressBar:Set(50)	--> Set the circle to 50%

progressBar:Add(10)	--> Fill the circle to 60%
progressBar:Add(1800)	--> Fill the circle to 100%
```

<br>

## Functions Documentation - Flag System

### > Overall

So the flag allows you to give the number of steps you want to achieve your progress-bar. <br>
For example, you know you have 16 key steps, for example loading assets, loading guis, loading data, player...
<br><br>
Well instead of adding the right number, you can simply use the Flag system. <br>
Basically, you need to set the End Flag (so how many steps will there be) then use the `Object:Flag` function when you achieve a step.

<br>

### > `Object:SetEndFlag(number)`

Sets the end flag. So if you want 234 steps to your progress bar, you can give 234 as the parametter. <br>
If your parametter is negative, it will return an error. <br>
**If you don't set the end flag, the Flag system wont work.**

<br>

### > `Object:Flag(number?)`

Flag means that you achive a step in your loading system. <br>
If you don't give parametter, we're going to next step until the EndFlag.
<br><br>
If you give a parametter, it will be set to the step you given as parametter.

<br>

### > Example

A basic example, flag without parametters :
```lua
local Module = require(script:FindFirstChild('CircularModule'))

local progressBar = Module:Create(Parent)
progressBar:SetEndFlag(3) 	--> There will be 3 steps to my project

--] Code to load assets...
progressBar:Flag()		--> Circle filled at 1/3

--] Code to load Player...
progressBar:Flag()		--> Circle filled at 2/3

--] Code to load meshes
progressBar:Flag()		--> Circle filled at 3/3 : The 3 steps have been completed, Circle is full
```

Another example, flags with and without parametters :
```lua
local Module = require(script:FindFirstChild('CircularModule'))

local myNumberOfSteps = 7

local progressBar = Module:Create(Parent)
progressBar:SetEndFlag(myNumberOfStaps) 	--> There will be 7 steps to my project

--] Quering data...
progressBar:Flag(1)				--> The circle is now filled at 1/7, the First step

for i = 1, 3 do
    --] Do something 3 times...
    progressBar:Flag()				--> The circle is now filled at 2/7, then 3/7 and then 4/7
end

for i = 1, 3 do
    --] Do something 3 times...
    progressBar:Flag(5)				--> This will only accomplish the 5th task, so circle is filled 5/7, 3 times
end

--] Loads player...
progressBar:Flag()				--> The circle is now filled at 6/7

--] Create Meshes locally...
progressBar:Flag(myNumberOfSteps)		--> The circle is now filled at 7/7, the Last step, circle is full
```
