-- LUIZ MENU V1 - FLING FANTASMA (SEM GIRAR)
TabFE:CreateToggle({
   Name = "Fling Fantasma (Invisível + Alcance) 👻",
   CurrentValue = false,
   Callback = function(Value)
      _G.GhostFling = Value
      
      if Value then
         task.spawn(function()
            local hrp = lp.Character.HumanoidRootPart
            
            -- Cria a força de giro que ninguém vê
            local rav = Instance.new("AngularVelocity", hrp)
            rav.Name = "InvisForce"
            rav.MaxTorque = math.huge
            rav.AngularVelocity = Vector3.new(0, 999999, 0) -- Força absurda
            
            -- Trava o teu corpo pra NÃO girar na tela (Giroscópio)
            local bg = Instance.new("BodyGyro", hrp)
            bg.P = 9e4
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.CFrame = hrp.CFrame

            while _G.GhostFling do
               for _, p in pairs(game.Players:GetPlayers()) do
                  if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                     local targetHRP = p.Character.HumanoidRootPart
                     local dist = (hrp.Position - targetHRP.Position).Magnitude
                     
                     -- Alcance de 10 metros: Se chegar perto, a física do servidor explode ele
                     if dist < 12 then
                        -- Simula um impacto sem tu precisares bater de frente
                        targetHRP.Velocity = Vector3.new(0, 100000, 0)
                        targetHRP.RotVelocity = Vector3.new(100000, 100000, 100000)
                     end
                  end
               end
               RunService.Heartbeat:Wait()
               -- Mantém o teu personagem sempre reto
               bg.CFrame = Camera.CFrame * CFrame.Angles(math.rad(-90), 0, 0) -- Ajuste de ângulo pra ficar em pé
            end
            
            rav:Destroy()
            bg:Destroy()
         end)
      end
   end,
})
