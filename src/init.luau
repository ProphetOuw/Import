local Path = script:GetFullName()
Path = "game."..Path
local RequireName = script.Name
local declare = `local {RequireName}`
local loadstring: any = loadstring
return function(module)
	if module == nil then return `Module is none existant,{debug.info(1,"l")}` end;
	if module.ClassName ~= "ModuleScript" then return  end;
	local Source = module.Source;
	local FullName = module:GetFullName()
	Source = Source:gsub("script%.", "game."..FullName..".")
	Source = Source:gsub("script%:", "game."..FullName..":")
	while string.find(Source,"require") ~= nil do
		Source = string.gsub(Source,"require",RequireName)
	end
	if string.find(Source,declare) == nil then
		Source = `{declare} = require({Path});`..Source
	end
	local ret = nil;
	pcall(function()
		ret = loadstring(Source,FullName)()
	end)
	if ret == nil then
		ret = require(module)
	end
	return ret
end