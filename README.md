# Import
When used, this module uses loadstring to run the source code of a given modulescript, it replaces all of the requires in that module script with the Import module. This package is useful for people who are making plugins or that might need to test script changes without having to go in test mode.
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