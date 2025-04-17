-- Carregar a OrionLib (GUI moderna e bonita)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Criar janela do hub
local Window = OrionLib:MakeWindow({Name = "Anime Power Hub | By TchingTchong", HidePremium = false, SaveConfig = false, IntroText = "Anime Power"})

-- Variáveis
local AutoFarm = false

-- 🥷 Aba de Auto Farm
local FarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

FarmTab:AddToggle({
	Name = "Ativar Auto Farm",
	Default = false,
	Callback = function(Value)
		AutoFarm = Value
		if AutoFarm then
			OrionLib:MakeNotification({
				Name = "Farm Ativado!",
				Content = "Auto farm está rodando...",
				Time = 3
			})
			while AutoFarm do
				pcall(function()
					-- Aqui você coloca o código de farm
					-- Exemplo de mover para algum mob (você pode ajustar isso conforme o jogo)
					local player = game.Players.LocalPlayer
					local character = player.Character or player.CharacterAdded:Wait()

					-- Exemplo genérico de busca de inimigos
					for _, enemy in pairs(workspace:GetDescendants()) do
						if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
							character:MoveTo(enemy.HumanoidRootPart.Position)
							wait(0.5)
						end
					end
				end)
				wait(1)
			end
		end
	end
})

-- 🚀 Aba de Teleport
local TeleportTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TeleportTab:AddDropdown({
	Name = "Escolher Área",
	Default = "Lobby",
	Options = {"Lobby", "Área 1", "Área 2"}, -- Adicione mais quando souber os nomes
	Callback = function(Value)
		local posicoes = {
			["Lobby"] = Vector3.new(0, 10, 0),
			["Área 1"] = Vector3.new(100, 10, 100),
			["Área 2"] = Vector3.new(200, 10, 200)
		}
		local pos = posicoes[Value]
		if pos then
			game.Players.LocalPlayer.Character:MoveTo(pos)
		end
	end    
})

-- Mensagem final
OrionLib:MakeNotification({
	Name = "Hub Carregado",
	Content = "Seu hub foi iniciado com sucesso!",
	Time = 3
})
