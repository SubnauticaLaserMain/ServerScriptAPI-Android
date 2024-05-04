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



local usingWalkSpeed = false
local oldWalkSpeed = 16

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
            GetHumanoid().JumpPower = 50
        end
    end)



    PlayerSection:AddSlider('FOV', 1, 120, 70, {toggleable = true, flag = 'Slider_Flag', fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
        if bool then
            Camera.FieldOfView = val
        else
            Camera.FieldOfView = 70
        end
    end)



    --[[REQUIRED FOR ROLES FUNCTION(S) TO WORK]]
    local MakeRole = game:GetService('ReplicatedStorage').RemoteEvents.MakeRole
    local OutsideRole = game:GetService('ReplicatedStorage').RemoteEvents.OutsideRole



    local Roles_Tables = {
        ['Kids'] = {
            ['The Nerd'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local NerdData = {
                            [1] = 'Book',
                            [2] = true
                        }

                        local _2nd_NerdData = {
                            [1] = 'Book',
                            [2] = true,
                            [3] = true
                        }


                        OutsideRole:FireServer(unpack(NerdData))
                        MakeRole:FireServer(unpack(_2nd_NerdData))
                    else
                        local NerdData = {
                            [1] = 'Book',
                            [2] = false
                        }

                        local _2nd_NerdData = {
                            [1] = 'Book',
                            [2] = true,
                            [3] = false
                        }


                        OutsideRole:FireServer(unpack(NerdData))
                        MakeRole:FireServer(unpack(_2nd_NerdData))
                    end
                end
            },

            ['The Sporty'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local Data = {
                            [1] = 'Bottle',
                            [2] = true,
                            [3] = true
                        }


                        MakeRole:FireServer(unpack(Data))
                    else
                        local Data = {
                            [1] = 'Bottle',
                            [2] = true,
                            [3] = false
                        }


                        MakeRole:FireServer(unpack(Data))
                    end
                end
            },

            ['The Hyper'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local Data = {
                            [1] = 'Lollipop',
                            [2] = true,
                            [3] = true
                        }


                        MakeRole:FireServer(unpack(Data))
                    else
                        local Data = {
                            [1] = 'Lollipop',
                            [2] = true,
                            [3] = false
                        }


                        MakeRole:FireServer(unpack(Data))
                    end
                end
            }
        },

        ['Adults'] = {
            ['The Hacker'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local NerdData = {
                            [1] = 'Phone',
                            [2] = true
                        }

                        local _2nd_NerdData = {
                            [1] = 'Phone',
                            [2] = false,
                            [3] = true
                        }


                        OutsideRole:FireServer(unpack(NerdData))
                        MakeRole:FireServer(unpack(_2nd_NerdData))
                    else
                        local NerdData = {
                            [1] = 'Phone',
                            [2] = false
                        }

                        local _2nd_NerdData = {
                            [1] = 'Phone',
                            [2] = false,
                            [3] = false
                        }


                        OutsideRole:FireServer(unpack(NerdData))
                        MakeRole:FireServer(unpack(_2nd_NerdData))
                    end
                end
            },

            ['The Medic'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local Data = {
                            [1] = 'Medkit',
                            [2] = false,
                            [3] = true
                        }


                        MakeRole:FireServer(unpack(Data))
                    else
                        local Data = {
                            [1] = 'Medkit',
                            [2] = false,
                            [3] = false
                        }


                        MakeRole:FireServer(unpack(Data))
                    end
                end
            },


            ['The Protector'] = {
                ['Equip'] = function(SkinOn)
                    if SkinOn and SkinOn == true then
                        local Data = {
                            [1] = 'Bat',
                            [2] = false,
                            [3] = true
                        }


                        MakeRole:FireServer(unpack(Data))
                    else
                        local Data = {
                            [1] = 'Bat',
                            [2] = false,
                            [3] = false
                        }


                        MakeRole:FireServer(unpack(Data))
                    end
                end
            }
        }
    }



    local Lobby_Tab = Window:AddTab('Lobby', {default = false})

    local Roles_Section = Lobby_Tab:AddSection('Roles', {default = false})




    local RoleSelectedFunction = function(...) print('Pls Select a Role') end
    local IsUsingSkin = false


    local Role_Kids = Roles_Section:AddDropdown('Kids', {'The Hyper', 'The Sporty', 'The Nerd'}, {default = 'The Sporty'}, function(selected)
        RoleSelectedFunction = Roles_Tables['Kids'][selected]['Equip']
    end)


    local Roles_Adults = Roles_Section:AddDropdown('Adults', {'The Protector', 'The Medic', 'The Hacker'}, {default = 'The Protector'}, function(selected)
        RoleSelectedFunction = Roles_Tables['Adults'][selected]['Equip']
    end)


    local SkinEquipedOn_Toggle = Roles_Section:AddToggle('Use Skin', {flag = 'Toggle_Flag', default = false}, function(on)
        IsUsingSkin = on
    end)

    Roles_Section:AddButton('Equip Role', function()
        if RoleSelectedFunction then
            RoleSelectedFunction(IsUsingSkin)
        end
    end)
