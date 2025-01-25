# Import
A roblox requiring module that uses loadstring. This is good for plugins as it uses the up to date source, it replaces all requires in the required module with Imports so it's nested.
## Installing
### Roblox
https://create.roblox.com/store/asset/91498231301781/Import
### Wally
```
Import = "prophetouw/import@1.0.0"
```
### Github
Go to the [releases](https://github.com/ProphetOuw/Import/releases/tag/v1) page and download the latest rbxm.
## How to use
```lua
local Import = require(path)
local moduleRequired = Import(game.ReplicatedStorage.module)
moduleRequired.DoSomething(...)
```