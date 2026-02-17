-- LUIZ EMOTE V1 🎭 (FIXED)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LUIZ EMOTE V1 🎭",
   LoadingTitle = "Sincronizando Animações...",
   LoadingSubtitle = "por Luiz",
   ConfigurationSaving = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "Sistema de Chave",
      Subtitle = "Digite a senha do Luiz",
      Note = "Luiz menu ⚡",
      FileName = "LuizKey",
      SaveKey = true,
      Key = {"Luizmenu2026"} 
   }
})

local lp = game:GetService("Players").LocalPlayer

-- Função para garantir que o script funciona mesmo após morrer
local function getHum()
    local char = lp.Character or lp.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

local function PlayAnim(id)
   local hum = getHum()
   local anim = Instance.new("Animation")
   anim.AnimationId = "rbxassetid://"..id
   local load = hum:LoadAnimation(anim)
   load:Play()
end

-- --- ABA 1: EMOTES 💃 ---
local TabEmotes = Window:CreateTab("Emotes 💃", 4483362458)

TabEmotes:CreateButton({
   Name = "Griddy (R15)",
   Callback = function() PlayAnim("10916301311") end,
})

TabEmotes:CreateButton({
   Name = "Floss",
   Callback = function() PlayAnim("59174527") end,
})

-- --- ABA 2: MOVIMENTOS REAIS (TODOS VÊEM) ⚠️ ---
local TabReal = Window:CreateTab("Movimentos Reais ⚠️", 4483362458)

TabReal:CreateToggle({
   Name = "Spin Bot (Dança Infinita)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Spin = Value
      task.spawn(function()
         while _G.Spin do
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(30), 0)
            end
            task.wait()
         end
      end)
   end,
})

Rayfield:Notify({Title = "SISTEMA ATUALIZADO", Content = "Se o emote não carregar, tente resetar o personagem!", Duration = 5})
