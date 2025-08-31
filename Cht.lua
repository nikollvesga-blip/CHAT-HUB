-- Nikollvesga Fire Sword KRNL Script
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Crear la espada
local sword = Instance.new("Tool")
sword.Name = "FireSword"
sword.RequiresHandle = true
sword.CanBeDropped = true
sword.Parent = backpack

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1,4,0.5)
handle.BrickColor = BrickColor.new("Bright yellow")
handle.Material = Enum.Material.Neon
handle.Parent = sword

-- Agregar fuego al handle
local fire = Instance.new("Fire")
fire.Heat = 15
fire.Size = 8
fire.Parent = handle

-- Opcional: daño al tocar enemigos
handle.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
    if humanoid and hit.Parent ~= player.Character then
        humanoid:TakeDamage(25)
    end
end)

print("🔥 Nikollvesga Fire Sword lista! Revisar tu mochila para equiparla.")
