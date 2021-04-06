local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local RunService = game:GetService("RunService")
local money = 0
RunService.RenderStepped:Connect(function()
    local poo,_ = string.gsub(game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text:split("$")[2], ",", "")
    money = tonumber(poo)
    print(tonumber(poo))
end)

local selectedMoney = 100
local UI = Material.Load({
    Title = "lmaoo#1360",
    Style = 2,
    SizeX = 200,
    SizeY = 350,
    Theme = "Dark"
})

function sendNotif(title, text)
   game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    }) 
end

function dropMoney(amount)
    game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "" .. amount)
    sendNotif("Money dropped!", "$" .. amount .. " dropped!")
    
end


local Page = UI.New({
    Title = "Drop Money"
})

Page.Button({
    Text = "Drop All Money",
    Callback = function()
        --local poggers = string.gsub(game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text:split("$")[2], ",", "")
        while money > 100 do
            dropMoney(money > 10000 and 10000 or money)
            wait(3)
        end
       --dropMoney(game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text:split("$")[1])
    end,
    Menu = {
        Info = function(self)
            UI.Banner({
                Text = "Drops all your money"            
            })
        end
    }
})

Page.Slider({
    Text = "Money",
    Min = 100,
    Max = 10000,
    Def = 0,
    Callback = function(val)
        selectedMoney = val
    end
})

Page.Button({
    Text = "Drop Money",
    Callback = function()
        dropMoney(selectedMoney)
    end,
    Menu = {
        Info = function(self)
            UI.Banner({
                Text = "Drops selected money"            
            })
        end
    }
})

--dropMoney(100)
