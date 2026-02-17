-- LUIZ EMOTE V1 - TOUCH FLING EDITION ⚡
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LUIZ FE BYPASS 🎭",
   LoadingTitle = "Injetando Física Invisível...",
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
local RunService = game:GetService("RunService")

-- --- ABA: BYPASS & FLING ⚠️ ---
local TabFE = Window:CreateTab("Bypass & Fling ⚠️", 4483362458)

TabFE:CreateToggle({
   Name = "Touch Fling (Matar ao Tocar) 💀",
   CurrentValue = false,
   Callback = function(Value)
      _G.TouchFling = Value
      task.spawn(function()
         while _G.TouchFling do
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
               local hrp = lp.Character.HumanoidRootPart
               
               -- Guarda a velocidade original para não bugar o teu movimento
               local oldVel = hrp.Velocity
               
               -- Aplica a força de Fling (Invisível aos olhos, mas real na física)
               hrp.Velocity = oldVel + Vector3.new(0, 3000, 0) -- Força vertical oculta
               hrp.RotVelocity = Vector3.new(0, 100000, 0) -- Rotação extrema invisível
               
               -- Noclip para não bugar no chão
               for _, v in pairs(lp.Character:GetDescendants()) do
                  if v:IsA("BasePart") then v.CanCollide = false end
               end
            end
            RunService.Heartbeat:Wait()
         end
      end)
   end,
})

TabFE:CreateToggle({
   Name = "Netless (Garantir o Fling) 🌐",
   CurrentValue = false,
   Callback = function(Value)
      _G.Netless = Value
      task.spawn(function()
         while _G.Netless do
            if lp.Character then
               for _, v in pairs(lp.Character:GetDescendants()) do
                  if v:IsA("BasePart") then
                     v.Velocity = Vector3.new(0, -30, 0) -- Mantém a posse da rede
                  end
               end
            end
            task.wait(0.1)
         end
      end)
   end,
})

-- --- ABA: EMOTES 💃 ---
local TabEmotes = Window:CreateTab("Emotes 💃", 4483362458)

TabEmotes:CreateButton({
   Name = "Griddy (R15)",
   Callback = function() 
       local anim = Instance.new("Animation")
       anim.AnimationId = "rbxassetid://10916301311"
       lp.Character.Humanoid:LoadAnimation(anim):Play()
   end,
})

Rayfield:Notify({Title = "TOUCH FLING ATIVO", Content = "Encoste nos players para eles voarem!", Duration = 5})
