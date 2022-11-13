



--[[
    Tab:CreateButton({
        Name = "",
        Callback = function()
                
        end,
    })
    
    Tab:CreateToggle({
	Name = "",
	CurrentValue = false,
	Callback = function(example)
	    if example == true then
            
        else
            
	    end
	    end,
    })
]]--

local NotesList = {"Made by Lunarosity", "UI by Sirius", "This note has a 1 in 7 chance of happening", "Solar Hub??", "This is a note", "Rayfield UI lib pretty cool", "You are using "..tostring(identifyexecutor())}
local Randomness = math.floor(math.random(#NotesList))
local RandomNotes = NotesList[Randomness]

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Lunar Hub".." - "..tostring(identifyexecutor()),
	LoadingTitle = "Lunar Hub",
	LoadingSubtitle = "Loading Lunar Hub...",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "LunarHub", -- Create a custom folder for your hub/game
		FileName = "LunarHubConfig"
	},
        Discord = {
        	Enabled = true,
        	Invite = "sirius", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Lunar Hub",
		Subtitle = "Lunar Key System",
		Note = RandomNotes,
		FileName = "LunarHubKey",
		SaveKey = true,
		GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "https://pastebin.com/raw/qr6uq8ZV"
	}
})

    local MainTab = Window:CreateTab("Main")
    local MainSection = MainTab:CreateSection("Main")
    
    MainTab:CreateButton({
	Name = "No Jumpscares",
	Callback = function()
		    game:GetService("Workspace")["SCREENS_AREA"].TheOrotund:Destroy()
		    game:GetService("Workspace")["SCREENS_AREA"].TheCajoler:Destroy()
	    end,
    })

    MainTab:CreateToggle({
	Name = "Allow Third-Person",
	CurrentValue = false,
	Flag = "ThirdPFlag",
	Callback = function(thirdp)
	    if thirdp == true then
	        game:GetService("Players").LocalPlayer.PlayerGui.FirstPerson:Destroy()
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
            game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
        else
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0.5
            game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	    end
	    end,
    })
    
    MainTab:CreateToggle({
	Name = "Full-Bright",
	CurrentValue = false,
	Flag = "FBFlag",
	Callback = function(fb)
	    if fb == true then
		    game:GetService("Lighting").Brightness = 2
	        game:GetService("Lighting").ClockTime = 14
	        game:GetService("Lighting").FogEnd = math.huge
	        game:GetService("Lighting").GlobalShadows = false
	        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 1
	        game:GetService("Lighting").ClockTime = 0
	        game:GetService("Lighting").FogEnd = 95
	        game:GetService("Lighting").GlobalShadows = true
	        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(226, 226, 226)
	    end
	    end,
    })

    local MainSection = MainTab:CreateSection("Other")

    MainTab:CreateButton({
        Name = "Give Axe",
        Callback = function()
            fireclickdetector(game:GetService("Workspace").Axe.Handle.ClickDetector)
        end,
    })

    MainTab:CreateButton({
        Name = "Destroy Skybox",
        Callback = function()
            game:GetService("Workspace").BlackSkybox:Destroy()
        end,
    })
    
    local MainSection = MainTab:CreateSection("Keybinds")
    
    MainTab:CreateKeybind({
        Name = "Reset Character",
        CurrentKeybind = "R",
        Callback = function(ResetChar)
            game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
    -- The variable (Keybind) is a string for the keybind currently in use
    end,
    })
        
    MainTab:CreateKeybind({
    Name = "Rejoin Game",
    CurrentKeybind = "T",
    Callback = function(RJ)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
    -- The variable (Keybind) is a string for the keybind currently in use
    end,
    })
    
    --ESP
    local EspTab = Window:CreateTab("ESP")
    local EspSection = EspTab:CreateSection("ESP")
    
    EspTab:CreateToggle({
	Name = "Monster ESP",
	CurrentValue = false,
	Flag = "ESPFlag",
	Callback = function(mESP)
	    if mESP == true then
            for i,v in pairs(game:GetService("Workspace").TheCajoler:GetDescendants()) do
            if v:IsA("Part") then
                local MonsterESP = Instance.new("Highlight")
                MonsterESP.Name = v.Name
                MonsterESP.FillTransparency = 0
                MonsterESP.OutlineTransparency = 0
                MonsterESP.FillColor = Color3.new(0, 0, 0)
                MonsterESP.OutlineColor = Color3.new(120, 0, 255)
                MonsterESP.Parent = game:GetService("Workspace").TheCajoler
                end
            end
            for i,v in pairs(game:GetService("Workspace").TheOrotund:GetDescendants()) do
            if v:IsA("Part") then
                local MonsterESP = Instance.new("Highlight")
                MonsterESP.Name = v.Name
                MonsterESP.FillTransparency = 0
                MonsterESP.OutlineTransparency = 0
                MonsterESP.FillColor = Color3.new(0, 0, 0)
                MonsterESP.OutlineColor = Color3.new(120, 0, 255)
                MonsterESP.Parent = game:GetService("Workspace").TheOrotund
                end
            end
        else
            for i,v in pairs(game:GetService("Workspace").TheCajoler:GetDescendants()) do
                if v:IsA("Highlight") then
                    v:Destroy()
                end
            end
            for i,v in pairs(game:GetService("Workspace").TheOrotund:GetDescendants()) do
                if v:IsA("Highlight") then
                    v:Destroy()
                end
            end
	    end
    end,
    })

    Rayfield:Notify({
        Title = "Successfully Loaded Lunar Hub",
        Content = "Lunar Hub has been loaded. Enjoy!",
        Duration = math.huge,
        Image = 4483362458,
        Actions = { -- Notification Buttons
            OkayAnswer = {
                Name = "Okay!",
                Callback = function()
                    Duration = 0
                end
            },
        },
    })

    Rayfield:Notify({
        Title = "Load Configuration?",
        Content = "Load your personal configuration (if you have one)",
        Duration = math.huge,
        Image = 4483362458,
        Actions = { -- Notification Buttons
            YesAnswer = {
                Name = "Yes",
                Callback = function()
                    Rayfield:LoadConfiguration()
                end
            },
            NoAnswer = {
                Name = "No",
                Callback = function()
                    Duration = 0
                end
            },
        },
    })