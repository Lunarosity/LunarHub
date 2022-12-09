


--[[
    Tab:CreateButton({
        Name = "",
        Interact = "",
        Callback = function()
                
        end,
    })
    
    Tab:CreateToggle({
	    Name = "",
	    CurrentValue = false,
	    Callback = function(example)
	        if example then
            
            else
            
	        end
	    end,
    })
]]--

local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Notes = {"Made by Lunarosity", "Lunar Hub", "Solar Hub does not exist", "BJYjhvIUTGKJ hgVFUvnV", "idk what to put here", "Rayfield UI by Sirius", "Every note has a 1/13 chance of appearing", "This note has a 1/13 chance of happening", "This is a note", "Arrayfield UI library cool", "You are using "..tostring(identifyexecutor()), "Arrayfield UI by Meta", "The key is definitely totally not RnUbUlTX0QywWEfg1PqN trust me", "hi"}
local Randomiser = math.floor(math.random(#Notes))
local RandomNotes = Notes[Randomiser]

----------[[]]----------

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Window = Rayfield:CreateWindow({
	Name = "Lunar Hub [V2]".." - "..tostring(identifyexecutor()).." | "..GameName,
	LoadingTitle = "Lunar Hub",
	LoadingSubtitle = "Loading Lunar Hub.",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "LunarHub", -- Create a custom folder for your hub/game
		FileName = "LunarHubTheMazeConfig"
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
		SaveKey = false,
		GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "https://raw.githubusercontent.com/Lunarosity/LunarHub/main/LH%20Key.txt"
	}
})

----------[[]]----------

    local LocalTab = Window:CreateTab("Local", 6034503364)
    local LocalSection = LocalTab:CreateSection("Local")
    
    LocalTab:CreateSlider({
        Name = "Walkspeed",
        Info = "Changes your walkspeed with a slider (16 is default speed).", -- Speaks for itself, Remove if none.
        Range = {5, 150},
        Increment = 1,
        Suffix = "WS",
        CurrentValue = 16,
        Flag = "WSSliderFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(SpeedSliderValue)
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = SpeedSliderValue
        end,
    })

    LocalTab:CreateInput({
        Name = "Advanced Walkspeed Changer",
        Info = "Advanced Walkspeed Value Changer (5 character limit).", -- Speaks for itself, Remove if none.
        PlaceholderText = "Input",
        NumbersOnly = true, -- If the user can only type numbers.
        CharacterLimit = 5, --max character limit. Remove if none.
        OnEnter = true, -- Will callback only if the user pressed ENTER while being focused.
        RemoveTextAfterFocusLost = true,
        Callback = function(AdvancedWSValue)
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = AdvancedWSValue
        end,
    })

    LocalTab:CreateButton({
        Name = "No Fall Damage",
        Info = "Disables fall damage from occuring.",
        Interact = "",
        Callback = function()
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("Script") and v.Name == "FallDamage" then
                        v:Destroy()
                    end
                end
        end,
    })

    LocalTab:CreateToggle({
	    Name = "Disable Crouching",
	    CurrentValue = false,
	    Callback = function(CrouchToggle)
	        if CrouchToggle then
                game:GetService("Players").LocalPlayer.PlayerGui.ButtonToCrouch.Enabled = false
            else
                game:GetService("Players").LocalPlayer.PlayerGui.ButtonToCrouch.Enabled = true
	        end
	    end,
    })

    local LocalSection = LocalTab:CreateSection("Keybinds")

    LocalTab:CreateKeybind({
        Name = "Reset Character",
        CurrentKeybind = "R",
        Callback = function(ResetChar)
            game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
    end,
    })
        
    LocalTab:CreateKeybind({
        Name = "Rejoin Game",
        CurrentKeybind = "T",
        Callback = function(RJ)
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
        end,
    })

----------[[]]----------

    local MainTab = Window:CreateTab("Main", 4483362458)
    local MainSection = MainTab:CreateSection("Main")
    
    MainTab:CreateButton({
	Name = "No Jumpscares",
	Info = "Disables all jumpscares in-game.",
	Callback = function()
        Window:Prompt({
            Title = 'Confirm.',
            SubTitle = 'Disabling jumpscares confirmation.',
            Content = 'Are you sure you want to disable jumpscares? By enabling this you cannot disable this at any time through the rest of this session, do you wish to proceed?',
            Actions = {
                Decline = {
                    Name = 'No.',
                    Callback = function()
                        print("the maze is a really bad game")
                    end,
                },
                Accept = {
                    Name = 'Yes.',
                    Callback = function()
                        game:GetService("Workspace")["SCREENS_AREA"].TheOrotund:Destroy()
		                game:GetService("Workspace")["SCREENS_AREA"].TheCajoler:Destroy()
                    end,
                }
            }
        })
	    end,
    })

    MainTab:CreateToggle({
	Name = "Allow Third-Person",
	Info = "Changes your view from First-Person to Third-Person.",
	CurrentValue = false,
	Flag = "ThirdPFlag",
	Callback = function(thirdp)
	    if thirdp then
            game:GetService("Players").LocalPlayer.PlayerGui.FirstPerson.Script.Disabled = true
                    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
                    game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
        else
            game:GetService("Players").LocalPlayer.PlayerGui.FirstPerson.Script.Disabled = false
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0.5
            game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	    end
	    end,
    })
    
    MainTab:CreateToggle({
	Name = "Full-Bright",
	Info = "Changes lighting values to allow for seeing in the dark.",
	CurrentValue = false,
	Flag = "FBFlag",
	Callback = function(fb)
	    if fb then
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

    MainTab:CreateButton({
        Name = "Infinite Flashlight Battery",
        Info = "Enable when flashlight is turned on or else it won't work.",
        Callback = function()
            game:GetService("Players").LocalPlayer.Character.Flashlight.Handle.BatteryEffected:Destroy()
        end,
    })

    local MainSection = MainTab:CreateSection("Other")

    
    
    

----------[[]]----------
    
    --ESP
    local EspTab = Window:CreateTab("ESP", 6031075931)
    local EspSection = EspTab:CreateSection("ESP")
    
    local MonsterESPLocal = EspTab:CreateToggle({
	Name = "Monster ESP",
	Info = "Allows you to see the monsters location through walls.",
	CurrentValue = false,
	Flag = "ESPFlag",
	Callback = function(mESP)
	    if mESP then
            for i,v in pairs(game:GetService("Workspace").TheCajoler:GetDescendants()) do
            if v:IsA("Model") then
                local CajolerESP = Instance.new("Highlight")
                CajolerESP.Name = v.Name
                CajolerESP.FillTransparency = 0
                CajolerESP.OutlineTransparency = 0
                CajolerESP.FillColor = Color3.new(0, 0, 0)
                CajolerESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                CajolerESP.Parent = game:GetService("Workspace").TheCajoler
                end
            end
            for i,v in pairs(game:GetService("Workspace").TheOrotund:GetDescendants()) do
            if v:IsA("Model") then
                local OrotundESP = Instance.new("Highlight")
                OrotundESP.Name = v.Name
                OrotundESP.FillTransparency = 0
                OrotundESP.OutlineTransparency = 0
                OrotundESP.FillColor = Color3.new(0, 0, 0)
                OrotundESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                OrotundESP.Parent = game:GetService("Workspace").TheOrotund
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

----------[[]]----------

    local OtherTab = Window:CreateTab("Other", 4483362458)
    local OtherSection = OtherTab:CreateSection("Other")
    
    OtherTab:CreateButton({
        Name = "Give Axe",
        Info = "Gives you an axe, can be used to escape pursuing monsters.",
        Callback = function()
            fireclickdetector(game:GetService("Workspace").Axe.Handle.ClickDetector)
        end,
    })

    OtherTab:CreateToggle({
        Name = "Disable Skybox",
        Info = "Designed for full-bright usage, useless without full-bright.",
        CurrentValue = false,
        Flag = "SkyboxRemoveFlag",
        Callback = function(SkyboxRemoval)
            if SkyboxRemoval then
                game:GetService("Workspace").BlackSkybox.Transparency = 1
            else
                game:GetService("Workspace").BlackSkybox.Transparency = 0
            end
        end,
    })

    OtherTab:CreateToggle({
        Name = "Disable Screen Filter",
        Info = "Disables the annoying vingette filter.",
        CurrentValue = false,
        Flag = "ScreenFilterFlag",
        Callback = function(ScreenFilterDisable)
            if ScreenFilterDisable then
                game:GetService("Players").LocalPlayer.PlayerGui.CurrentView.Enabled = false
            else
                game:GetService("Players").LocalPlayer.PlayerGui.CurrentView.Enabled = true
            end
        end,
    })

----------[[]]----------

    local CreditsTab = Window:CreateTab("Credits", 6026568229)
    local CreditsSection = CreditsTab:CreateSection("Credits")
    
    CreditsTab:CreateParagraph({
        Title = "UI Library", 
        Content = [[Rayfield by Shlex
https://rayfield-docs.vercel.app/en/introduction
        
Arrayfield (modified Rayfield) by Meta
https://arraydocumentation.vercel.app/en/introduction]],
    })

    local CreditsSection = CreditsTab:CreateSection("Links")

    CreditsTab:CreateButton({
        Name = "Copy Rayfield Documentation Link",
        Info = "Copies the Rayfield Library Documentation link onto your clipboard.", -- Speaks for itself, Remove if none.
        Interact = "Button",
        Callback = function()
            setclipboard("https://rayfield-docs.vercel.app/en/introduction")
        end,
    })

    CreditsTab:CreateButton({
        Name = "Copy Arrayfield Documentation Link",
        Info = "Copies the Arrayfield Library Documentation link onto your clipboard.", -- Speaks for itself, Remove if none.
        Interact = "Button",
        Callback = function()
            setclipboard("https://arraydocumentation.vercel.app/en/introduction")
        end,
    })

    local CreditsSection = CreditsTab:CreateSection("Discord Invite")
    
    CreditsTab:CreateButton({
        Name = "Copy Sirius Discord server link",
        Info = "Copies the Sirius Discord server link to your clipboard (Rayfield Devs).", -- Speaks for itself, Remove if none.
        Interact = "Button",
        Callback = function()
            setclipboard("https://discord.gg/sirius")
        end,
    })

----------[[]]----------

    Rayfield:Notify({
        Title = "Successfully Loaded Lunar Hub.",
        Content = "Lunar Hub has been loaded, enjoy!",
        Duration = math.huge,
        Image = 6023426923,
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
        Content = "Loads your personal configuration (if you have one).",
        Duration = math.huge,
        Image = 6023426923,
        Actions = { -- Notification Buttons
            YesAnswer = {
                Name = "Yes.",
                Callback = function()
                    Rayfield:LoadConfiguration()
                end
            },
            NoAnswer = {
                Name = "No.",
                Callback = function()
                    Duration = 0
                end
            },
        },
    })
