--[[ // Service(s) \\]]
local CorePackages = game:GetService('CorePackages')
local PlayerService = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')



--[[// Roblox Service(s) \\]]
---local Roact = getrenv().require(CorePackages.Roact)



local function HttpGet(HttpLink, Boolean)
    return game:HttpGet(HttpLink, (Boolean or false))
end





local GamesSupported = ({
    -- In Game (Break In 2)
    [13864667823] = HttpGet('https://raw.githubusercontent.com/SubnauticaLaserMain/ServerScriptAPI-Android/main/BreakIn2-InGame.lua', true),
    -- Lobby (Break In 2)
    [13864661000] = HttpGet('https://github.com/SubnauticaLaserMain/ServerScriptAPI-Android/blob/main/BreakIn2-Lobby.lua', true)
})[game.PlaceId]


if GamesSupported ~= nil then
    loadstring(GamesSupported)()
end
