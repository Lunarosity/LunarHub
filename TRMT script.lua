



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
	Name = "Lunar Hub".." - "..tostring(identifyexecutor()).." - [V1.0.0:EA]",
	LoadingTitle = "Lunar Hub",
	LoadingSubtitle = "Loading Lunar Hub...",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "LunarHub", -- Create a custom folder for your hub/game
		FileName = "LunarHubTRMTConfig"
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

    local LocalTab = Window:CreateTab("Local")
    local LocalSection = LocalTab:CreateSection("Local")

    LocalTab:CreateButton({
        Name = "No Fall Damage",
        Callback = function()
            game:GetService("Players").LocalPlayer.Character.FallDamage:Destroy()
        end,
    })

    LocalTab:CreateToggle({
	    Name = "Disable Screen Bobbing",
	    CurrentValue = false,
	    Callback = function(NoScreenBob)
	        if NoScreenBob then
                game:GetService("Players").LocalPlayer.Character.ViewBobbing.Enabled = false
                game:GetService("Players").LocalPlayer.Character.WalkScreen.Enabled = false
            else
                game:GetService("Players").LocalPlayer.Character.ViewBobbing.Enabled = true
                game:GetService("Players").LocalPlayer.Character.WalkScreen.Enabled = true
	        end
	    end,
    })

    local LocalSection = LocalTab:CreateSection("Blatant")

    LocalTab:CreateSlider({
        Name = "Walkspeed",
        Range = {16, 150},
        Increment = 1,
        Suffix = "WS",
        CurrentValue = 16,
        Flag = "WalkspeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(WSSliderValue)
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = WSSliderValue
        end,
    })

    local RakeTab = Window:CreateTab("Rake")
    local RakeSection = RakeTab:CreateSection("Rake")

    RakeTab:CreateButton({
        Name = "Disable Rake Damage",
        Callback = function()
            game:GetService("Workspace").The_Rake.DamageBox:Destroy()
        end,
    })

    RakeTab:CreateButton({
        Name = "Disable Rake Swinging",
        Callback = function()
            game:GetService("Workspace").The_Rake.Torso.HitBox:Destroy()
        end,
    })

    local RakeSection = RakeTab:CreateSection("ESP")

    RakeTab:CreateToggle({
        Name = "Rake ESP",
        CurrentValue = false,
        Flag = "RakeESPFlag",
        Callback = function(mESP)
            if mESP then
                for i,v in pairs(game:GetService("Workspace").The_Rake:GetDescendants()) do
                if v:IsA("Part") then
                    local RakeESP = Instance.new("Highlight")
                    RakeESP.Name = v.Name
                    RakeESP.FillTransparency = 0
                    RakeESP.OutlineTransparency = 0
                    RakeESP.FillColor = Color3.new(0, 0, 0)
                    RakeESP.OutlineColor = Color3.new(255, 255, 255)
                    RakeESP.Parent = game:GetService("Workspace").The_Rake
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace").The_Rake:GetDescendants()) do
                    if v:IsA("Highlight") then
                        v:Destroy()
                    end
                end
            end
        end,
    })

    local EventTab = Window:CreateTab("Event")
    local EventSection = EventTab:CreateSection("Event")

    EventTab:CreateToggle({
        Name = "Insta-Collect Pumpkins",
        CurrentValue = false,
        Flag = "PumpkinCollectFlag",
        Callback = function(pCollectTime)
            if pCollectTime then
                for i,v in pairs(game:GetService("Workspace").Halloween_Pumpkin_Event:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace").Halloween_Pumpkin_Event:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        v.HoldDuration = 0.5
                    end
                end
            end
        end,
    })

    EventTab:CreateToggle({
        Name = "Pumpkin ESP",
        CurrentValue = false,
        Flag = "PumpkinESPFlag",
        Callback = function(pESP)
            if pESP then
                for i,v in pairs(game:GetService("Workspace").Halloween_Pumpkin_Event:GetDescendants()) do
                if v:IsA("Part") then
                    local PumpkinESP = Instance.new("Highlight")
                    PumpkinESP.Name = v.Name
                    PumpkinESP.FillTransparency = 0
                    PumpkinESP.OutlineTransparency = 0
                    PumpkinESP.FillColor = Color3.new(255, 95, 31)
                    PumpkinESP.OutlineColor = Color3.new(255, 255, 255)
                    PumpkinESP.Parent = game:GetService("Workspace").Halloween_Pumpkin_Event
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace").Halloween_Pumpkin_Event:GetDescendants()) do
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
            Answer = {
                Name = "Okay!",
                Callback = function()
                    Duration = 0
                end
            },
        },
    })

    wait(3)

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