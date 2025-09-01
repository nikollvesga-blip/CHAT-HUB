-- Script para KRNL: volverse gigante
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local scaleFactor = 5 -- Cuánto quieres crecer (5 = 5 veces más grande)

-- Función para escalar partes del personaje
local function scaleCharacter(character, factor)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Size = part.Size * factor
            -- Ajustar la posición relativa para que no se separe
            part.Position = part.Position * factor
        elseif part:IsA("Accessory") then
            -- Escalar accesorios
            if part:FindFirstChild("Handle") then
                part.Handle.Size = part.Handle.Size * factor
                part.Handle.Position = part.Handle.Position * factor
            end
        end
    end
end

-- Escalar el Humanoid para mantener animaciones y hitbox
humanoid.BodyHeightScale.Value = humanoid.BodyHeightScale.Value * scaleFactor
humanoid.BodyWidthScale.Value = humanoid.BodyWidthScale.Value * scaleFactor
humanoid.BodyDepthScale.Value = humanoid.BodyDepthScale.Value * scaleFactor
humanoid.HeadScale.Value = humanoid.HeadScale.Value * scaleFactor

-- Aplicar escala a todo el personaje
scaleCharacter(character, scaleFactor)

print("¡Te has vuelto gigante!")
