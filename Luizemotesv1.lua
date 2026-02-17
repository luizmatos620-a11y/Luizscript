-- ABA TYCON GOD PARA O LUIZ MENU
local TabTycon = Window:CreateTab("Tycon God 💸", 4483362458)

TabTycon:CreateToggle({
   Name = "Coletar Dinheiro Automático 💰",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoCollect = Value
      task.spawn(function()
         while _G.AutoCollect do
            -- Procura por botões de coletar ou partes que dão dinheiro no mapa
            for _, v in pairs(workspace:GetDescendants()) do
               if v:IsA("TouchTransmitter") and (v.Parent.Name:find("Collect") or v.Parent.Name:find("Giver")) then
                  firetouchinterest(lp.Character.HumanoidRootPart, v.Parent, 0)
                  firetouchinterest(lp.Character.HumanoidRootPart, v.Parent, 1)
               end
            end
            task.wait(1) -- Espera 1 segundo para não travar o Delta
         end
      end)
   end,
})

TabTycon:CreateToggle({
   Name = "Comprar Máquinas Automático 🏗️",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoBuy = Value
      task.spawn(function()
         while _G.AutoBuy do
            -- Tenta tocar em todos os botões de compra que você tem dinheiro para pagar
            for _, v in pairs(workspace:GetDescendants()) do
               if v.Name == "TouchInterest" and v.Parent:FindFirstChild("Head") and v.Parent:FindFirstChild("Price") then
                  firetouchinterest(lp.Character.HumanoidRootPart, v.Parent, 0)
                  firetouchinterest(lp.Character.HumanoidRootPart, v.Parent, 1)
               end
            end
            task.wait(0.5)
         end
      end)
   end,
})

TabTycon:CreateButton({
   Name = "Dropar Dinheiro (Visual/Lag) 💵",
   Callback = function()
      -- Cria clones visuais de dinheiro ao seu redor (Apenas para ostentar ou lagar o servidor)
      for i = 1, 50 do
         local part = Instance.new("Part", workspace)
         part.Size = Vector3.new(2, 0.2, 1)
         part.Color = Color3.fromRGB(0, 255, 0)
         part.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-5,5), 10, math.random(-5,5))
         part.CanCollide = true
      end
   end,
})
