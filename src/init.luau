local Path = script:GetFullName()
Path = "game."..Path
local RequireName = script.Name
local declare = `local {RequireName}`

local function IsValidRobloxName(name: string): boolean
	return name:match("^[A-Za-z_][A-Za-z0-9_]*$") ~= nil
end

local function EscapeInstancePath(instance: Instance): string
	local path = {}
	while instance and instance ~= game do
		local name = instance.Name
		if IsValidRobloxName(name) then
			table.insert(path, 1, "." .. name)
		else
			table.insert(path, 1, `["{name}"]`)
		end
		instance = instance.Parent :: Instance
	end
	return "game" .. table.concat(path)
end
return function(module: ModuleScript, DetailedStack: boolean)
	if module == nil then return `Module is none existant,{debug.info(1,"l")}` end;
	if module.ClassName ~= "ModuleScript" then return  end;
	local Source = module.Source;
	local FullName = EscapeInstancePath(module)
	Source = Source:gsub("script%.", FullName..".")
	Source = Source:gsub("script%:", FullName..":")

	Source = string.gsub(Source,"require",RequireName)

	if string.find(Source,declare) == nil then
		Source = `{declare} = require({Path});`..Source
	end

	
	local mod = nil
	
	if DetailedStack then
		-- if we want a detailed stack for errors(Not recommended for big systems).
		local clone = Instance.new("ModuleScript");
		clone.Name = module.Name;
		clone.Source = Source;
		clone.Parent = module.Parent;
		pcall(function()
			mod = require(clone);
		end)
		clone:Destroy()
	else
		-- loadstring is faster than require, but it doesn't have the same error stack trace(Recommended for big systems).
		pcall(function()
			if Source ~= nil then
				mod = loadstring(Source)
				if mod ~= nil then
					mod = mod();
				end
			end;
		end)
	end
	if mod == nil then
		mod = require(module)
	end
	return mod
end