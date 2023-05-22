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

### > `Object:SetColors`

The `Object:SetColors` function takes one parametter, which is a dictionnay that contains `Parametter.Fill` and `Parametter.Empty`, which are bother Color3 values. <br>
By default, the Fill value will be set to Green (#33cc33) and the empty to White (#ffffff)

Here is an example on how to set your custom colors :
```lua
local Module = require(script:FindFirstChild('CircularModule'))

local progressBar = Module:Create(Parent)

--> For Red fill with Black background
progressBar:SetColors({
  Fill = Color3.fromRGB(255, 0, 0),
  Empty = Color3.fromRGB(0, 0, 0)
})

--> Change the Red to Blue
progressBar:SetColors({
  Empty = Color3.fromRGB(0, 255, 0)
})
```
