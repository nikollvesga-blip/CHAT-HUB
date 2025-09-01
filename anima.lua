-- Animación de "Cargando..." en Lua (ejemplo educativo)
-- Autor: TuNombre
-- Fecha: 2025-09-01

-- Función para limpiar la pantalla
function limpiarPantalla()
    if package.config:sub(1,1) == "\\" then
        os.execute("cls") -- Windows
    else
        os.execute("clear") -- Linux/Mac
    end
end

-- Función para animar cargando
function animarCargando()
    local frames = { "|", "/", "-", "\\" }
    for i = 1, 20 do
        limpiarPantalla()
        local frame = frames[(i % #frames) + 1]
        print("Cargando... " .. frame)
        if package.config:sub(1,1) == "\\" then
            os.execute("ping -n 2 localhost >nul") -- Windows
        else
            os.execute("sleep 0.2") -- Linux/Mac
        end
    end
end

-- Ejecutar
print("▶ Iniciando animación")
animarCargando()
print("✅ Listo!")
