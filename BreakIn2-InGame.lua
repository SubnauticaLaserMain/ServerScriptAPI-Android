--[[ // Service(s) \\]]
local CorePackages = game:GetService('CorePackages')
local PlayerService = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')



--[[// Roblox Service(s) \\]]
---local Roact = getrenv().require(CorePackages.Roact)


--[[// Game Stuff \\]]
local Camera = workspace.CurrentCamera





local function GetHumanoid()
    local Character = PlayerService.LocalPlayer.Character or PlayerService.LocalPlayer.CharacterAdded:Wait()




    if Character then
        local Humanoid = Character:FindFirstChildOfClass('Humanoid')


        if Humanoid then
            return Humanoid
        end
    end
end






local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua'))()



--[[LOADER FOR: Break In 2 - In-Game]]

    local Window = Library:AddWindow({
        title = {'ServerScriptAPI', 'Break 2 | In-Game'},
        theme = {
            Accent = Color3.fromRGB(128, 0, 128)
        },
        key = Enum.KeyCode.LeftShift,
        default = true
    })


    local MainTab = Window:AddTab('Main', {default = true})

    local PlayerSection = MainTab:AddSection('Player', {default = false})


    PlayerSection:AddSlider('WalkSpeed', 1, 100, 16, {toggleable = true, flag = 'Slider_Flag', fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
        if not usingWalkSpeed then oldWalkSpeed = GetHumanoid().WalkSpeed end


        usingWalkSpeed = val


        if bool then
            GetHumanoid().WalkSpeed = val
        else
            GetHumanoid().WalkSpeed = oldWalkSpeed
        end
    end)




    PlayerSection:AddSlider('JumpPower', 1, 1000, 50, {toggleable = true, flag = 'Slider_Flag', fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
        if bool then
            GetHumanoid().JumpPower = val
        else
            GetHumanoid().JumpPower = oldWalkSpeed
        end
    end)



    PlayerSection:AddSlider('FOV', 1, 120, 70, {toggleable = true, flag = 'Slider_Flag', fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
        if bool then
            Camera.FieldOfView = val
        else
            Camera.FieldOfView = 70
        end
    end)





    local Events = game:GetService('ReplicatedStorage').Events
    local LocalPlayer = PlayerService.LocalPlayer



    local function GiveTool(Item)
        if Item == 'Armor' then
            Events:WaitForChild('Vending'):FireServer(3, 'Armor2', 'Armor', tostring(LocalPlayer), 1)
        elseif Item == 'Crowbar 1' or Item == 'Crowbar 2' or Item == "Bat" or Item == "Pitchfork" or Item == "Hammer" or Item == "Wrench" or Item == "Broom" then
            Events.Vending:FireServer(3, tostring(Item:gsub(" ", "")), "Weapons", LocalPlayer.Name, 1)
        else
            Events:WaitForChild('GiveTool'):FireServer(tostring(Item:gsub(" ", "")))
        end
    end



    local function Delete(Instance)
        pcall(function()
            Events:WaitForChild("OnDoorHit"):FireServer(Instance)
        end)
    end

    local function UnequipAllTools()
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Backpack
            end
        end
    end

    local function EquipAllTools()
        for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Character
            end
        end
    end

    local function Train(Ability)
        Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
    end



    local function HealAllPlayers()
        UnequipAllTools()
        task.wait(.2)
        GiveTool("Golden Apple")
        task.wait(.5)
        LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
        task.wait(.5)
        Events:WaitForChild("HealTheNoobs"):FireServer()
    end





    local function BreakEnemies()
        pcall(function()
            for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
                v:FindFirstChild("Humanoid", true).Health = 0
            end
            for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
                v:FindFirstChild("Humanoid", true).Health = 0
            end
            for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
                v:FindFirstChild("Humanoid", true).Health = 0
            end
        end)
    end

    local function KillEnemies()
        pcall(function()
            for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
                Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
            end
            for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
                Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
            end
            for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
                Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
            end
            if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
                Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
            end
            if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
                Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
            end
        end)
    end

    local function Noclip(State)
        LocalPlayer.Character.HumanoidRootPart.CanCollide = State
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("MeshPart") then
                v.CanCollide = State
            end
        end
    end













    local Item_Giving_Functions = {
        ['Foods'] = {
            ['Apple'] = {
                ['GiveItem'] = function()
                    GiveTool('Apple')
                end
            },

            ['Cookie'] = {
                ['GiveItem'] = function()
                    GiveTool('Cookie')
                end
            },

            ['Bloxy Cola'] = {
                ['GiveItem'] = function()
                    GiveTool('BloxyCola')
                end
            },

            ['Expired Bloxy Cola'] = {
                ['GiveItem'] = function()
                    GiveTool('ExpiredBloxyCola')
                end
            },
        },

        ['Weapons'] = {
            ['Bat'] = {
                ['GiveItem'] = function()
                    GiveTool('Bat')
                end
            },
            ['Wrench'] = {
                ['GiveItem'] = function()
                    GiveTool('Wrench')
                end
            },
            ['Pitchfork'] = {
                ['GiveItem'] = function()
                    GiveTool('Pitchfork')
                end
            }
            ['Hammer'] = {
                ['GiveItem'] = function()
                    GiveTool('Hammer')
                end
            },
            ['Broom'] = {
                ['GiveItem'] = function()
                    GiveTool('Broom')
                end
            },
            ['Crowbar 1'] = {
                ['GiveItem'] = function()
                    GiveTool('Crowbar 1')
                end
            },
            ['Crowbar 2'] = {
                ['GiveItem'] = function()
                    GiveTool('Crowbar 2')
                end
            }
        },

        ['Healing'] = {
            ['Med Kit'] = {
                ['GiveItem'] = function()
                    GiveTool('MedKit')
                end
            },

            ['Golden Apple'] = {
                ['GiveItem'] = function()
                    GiveTool('GoldenApple')
                end
            },

            ['Golden Pizza'] = {
                ['GiveItem'] = function()
                    GiveTool('GoldPizza')
                end
            }
        },

        ['Items'] = {

        }

        ['Extra'] = {
            ['Armor'] = {
                ['GiveItem'] = function()
                    GiveTool('Armor')
                end
            },

            ['Rainbow Pizza Box'] = {
                ['GiveItem'] = function()
                    GiveTool('RainbowPizzaBox')
                end
            }
        }
    }



    local InGame_Tab = Window:AddTab('In-Game', {default = false})


    local Items_Section = InGame_Tab:AddSection('Item-Giver', {default = false})





    local Food_Dropdown = Items_Section:AddDropdown('Foods', {'Apple', 'Cookie', 'Bloxy Cola', 'Expired Bloxy Cola'}, {default = 'Apple'}, function(selected)
        Item_Giving_Functions['Foods'][selected]['GiveItem']()
    end)
