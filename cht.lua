-- Nikollvesga Fly Chair KRNL (control con joystick/movimiento normal)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")

-- Crear la silla dorada
local chair = Instance.new("Seat")
chair.Size = Vector3.new(4, 1, 4)
chair.Anchored = false
chair.CanCollide = false
chair.BrickColor = BrickColor.new("Bright yellow")
chair.Position = hrp.Position + Vector3.new(0, 3, 0)
chair.Parent = workspace

-- Montar al jugador en la silla
character:MoveTo(chair.Position)
hrp.CFrame = chair.CFrame
chair:Sit(humanoid)

-- Crear fuego debajo de la silla
local firePart = Instance.new("Part")
firePart.Size = Vector3.new(4, 1, 4)
firePart.Anchored = true
firePart.CanCollide = false
firePart.Position = chair.Position - Vector3.new(0, 3, 0)
firePart.Parent = workspace

local fire = Instance.new("Fire")
fire.Heat = 10
fire.Size = 10
fire.Parent = firePart

-- Variables de vuelo
local speed = 50

-- Función de vuelo con dirección del humanoide
RunService.Heartbeat:Connect(function(delta)
    local direction = humanoid.MoveDirection
    if direction.Magnitude > 0 then
        chair.CFrame = chair.CFrame + direction.Unit * speed * delta
    end
    firePart.Position = chair.Position - Vector3.new(0, 3, 0)
end)

print("🚀 Nikollvesga Fly Chair activo! Usa los controles normales para moverte y volar.")
