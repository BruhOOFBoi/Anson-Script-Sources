Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/Script-Assets/main/UI-Lib/VisionLib.lua'))()

do
    Gui = Library:Create({
        Name = "Anson Hub", -- String
        ShadowColor = Color3.new(0, 0, 0), -- Color3
        ToggleKey = Enum.KeyCode.RightShift -- Enum.Keycode
    })

    do
        esptab = Gui:Tab({
            Name = "ESP",
            Icon = "",
            Color = Color3.new(1, 0, 0)
        })

        espbutton = esptab:Button({
            Name = "Highlight",
            Callback = function()
                for i,v in pairs(workspace.Vehicles:GetDescendants()) do
                    if v.Name == "Jet" then
                        esp = Instance.new("Highlight", v.Model.Body)
                        esp.FillColor = v.Model.Body.Color
                        esp.OutlineColor = v.Model.Body.Color
                    end
                end
            end
        })
    end
end
