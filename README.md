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

Now that the Module is created, we can use the `Module:Create` function to create Circle Object. The Circle Object is basically the circle gui object you can manipulate individually.
```lua


