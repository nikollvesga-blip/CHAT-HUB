-- Animación de caída en Lua (ASCII Art)
-- Autor: TuNombre
-- Fecha: 2025-09-01

-- Secuencia de la animación
local animacionCaida = {
[[
 O
/|\
/ \
De pie...
]],
[[
 O
/|\
/ \
 Tropieza...
]],
[[
\O
 |\
/ \
Se inclina...
]],
[[
\O/
 | 
/ \
Gira en el aire...
]],
[[
 O
/|\
/ \
Cae al suelo...
]],
[[
  x_x
 /|\
 / \
En el suelo...
]]
}

-- Reproduce la animación
function reproducirAnimacion(animacion, delay)
    for i, frame in ipairs(animacion) do
        -- Limpia la pantalla (clear en Linux/macOS, cls en Windows)
        if package.config:sub(1,1) == "\\" then
            os.execute("cls") -- Windows
        else
            os.execute("clear") -- Linux/Mac
        end
        print(frame)
        os.execute("sleep " .. tonumber(delay))
    end
end

-- Ejecutar animación
print("▶ Iniciando animación de caída...")
reproducirAnimacion(animacionCaida, 1)
print("✅ Animación terminada")
