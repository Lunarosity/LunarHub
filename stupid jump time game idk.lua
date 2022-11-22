



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
		FileName = "LunarHubJumpGameConfig"
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

    

    local GamepassTab = Window:CreateTab("Gamepass")
    local GamepassSection = GamepassTab:CreateSection("Gamepass")

    GamepassesTab:CreateToggle({
        Name = "Free Double Jump",
        CurrentValue = false,
        Callback = function(FreeDoubleJ)
            if FreeDoubleJ == true then
                game:GetService("Players").LocalPlayer.PlayerScripts.DoubleJump.DoubleJump.Enabled = true
            else
                game:GetService("Players").LocalPlayer.PlayerScripts.DoubleJump.DoubleJump.Enabled = false
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