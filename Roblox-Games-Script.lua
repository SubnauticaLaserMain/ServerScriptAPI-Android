--[[ // Service(s) \\]]
local CorePackages = game:GetService('CorePackages')
local PlayerService = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')



--[[// Roblox Service(s) \\]]
local Roact = getrenv().require(CorePackages.Roact)


--[[// Game Stuff \\]]
local Camera = workspace.CurrentCamera




local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua'))()




local function GetHumanoid()
    local Character = PlayerService.LocalPlayer.Character or PlayerService.LocalPlayer.CharacterAdded:Wait()




    if Character then
        local Humanoid = Character:FindFirstChildOfClass('Humanoid')


        if Humanoid then
            return Humanoid
        end
    end
end




local oldWalkSpeed = GetHumanoid().WalkSpeed
local usingWalkSpeed = false



local Games = ({
    [13864661000] = (function()
        --[[LOADER FOR: Break In 2 - LOBBY]]

        local Window = Library:AddWindow({
            title = {'ServerScriptAPI', 'Break 2 | Lobby'},
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
    end)
})[game.PlaceId]


if Games then
    --[[IF THE GAME IS SUPPORTED THEN LOAD IT]]
    Games()
end
