local SpectateGui = Instance.new("ScreenGui")
local Spectate = Instance.new("TextButton")
local SpectateWindow = Instance.new("TextLabel")
local Main = Instance.new("TextLabel")
local Text = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
local Right = Instance.new("TextButton")
local Left = Instance.new("TextButton")
 
--Properties:
 
SpectateGui.Name = "SpectateGui"
SpectateGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
Spectate.Name = "Spectate"
Spectate.Parent = SpectateGui
Spectate.BackgroundColor3 = Color3.fromRGB(51, 191, 255)
Spectate.BorderColor3 = Color3.fromRGB(0, 0, 0)
Spectate.BorderSizePixel = 2
Spectate.Position = UDim2.new(0, 3, 0, 250)
Spectate.Size = UDim2.new(0, 100, 0, 40)
Spectate.ZIndex = 2
Spectate.Font = Enum.Font.SourceSans
Spectate.Text = "Spectate"
Spectate.TextColor3 = Color3.fromRGB(0, 0, 0)
Spectate.TextScaled = true
Spectate.TextSize = 14.000
Spectate.TextWrapped = true
 
SpectateWindow.Name = "SpectateWindow"
SpectateWindow.Parent = SpectateGui
SpectateWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpectateWindow.BackgroundTransparency = 1.000
SpectateWindow.Size = UDim2.new(1, 0, 1, 0)
SpectateWindow.Visible = false
SpectateWindow.Font = Enum.Font.SourceSans
SpectateWindow.Text = ""
SpectateWindow.TextSize = 14.000
 
Main.Name = "Main"
Main.Parent = SpectateWindow
Main.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Main.Position = UDim2.new(0, 0, 1, -80)
Main.Size = UDim2.new(1, 0, 0, 80)
Main.Font = Enum.Font.SourceSans
Main.Text = ""
Main.TextSize = 14.000
 
Text.Name = "Text"
Text.Parent = Main
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.Position = UDim2.new(0.5, -298, 0, 0)
Text.Size = UDim2.new(0, 597, 0, 25)
Text.Font = Enum.Font.SourceSans
Text.Text = "ur stalking"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextScaled = true
Text.TextSize = 14.000
Text.TextStrokeTransparency = 0.000
Text.TextWrapped = true
 
Name.Name = "Name"
Name.Parent = Main
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.5, -250, 1, -50)
Name.Size = UDim2.new(0, 500, 0, 50)
Name.Font = Enum.Font.SourceSans
Name.Text = ""
Name.TextColor3 = Color3.fromRGB(255, 170, 0)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextStrokeTransparency = 0.000
Name.TextWrapped = true
 
Right.Name = "Right"
Right.Parent = Main
Right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Right.BorderColor3 = Color3.fromRGB(255, 0, 0)
Right.BorderSizePixel = 3
Right.Position = UDim2.new(0.800000012, 0, 0.5, -25)
Right.Size = UDim2.new(0, 50, 0, 50)
Right.ZIndex = 2
Right.Font = Enum.Font.SourceSans
Right.Text = ">"
Right.TextColor3 = Color3.fromRGB(255, 255, 255)
Right.TextSize = 60.000
 
Left.Name = "Left"
Left.Parent = Main
Left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Left.BorderColor3 = Color3.fromRGB(255, 0, 0)
Left.BorderSizePixel = 3
Left.Position = UDim2.new(0.150000006, 0, 0.5, -25)
Left.Size = UDim2.new(0, 50, 0, 50)
Left.ZIndex = 2
Left.Font = Enum.Font.SourceSans
Left.Text = "<"
Left.TextColor3 = Color3.fromRGB(255, 255, 255)
Left.TextSize = 60.000
 
-- Scripts:
 
local function WUORLWK_fake_script() -- SpectateGui.SpectatingScript 
	local script = Instance.new('LocalScript', SpectateGui)
 
	local gui = script.Parent
	local player = game.Players.LocalPlayer
	local cam = game.Workspace.CurrentCamera
	local spectateB = gui:WaitForChild("Spectate")
	local spectateW = gui:WaitForChild("SpectateWindow")
	local main = spectateW:WaitForChild("Main")
	local name = main:WaitForChild("Name")
	local number = 1
 
	spectateB.MouseButton1Down:connect(function()
		if spectateW.Visible == false then
			spectateW.Visible = true
			spectateB.Text = "Stop Spectating"
			for index, players in pairs(game.Players:GetPlayers()) do
				if number == index then
					local character = game.Workspace:WaitForChild(players.Name)
					cam.CameraSubject = character.Head
					name.Text = cam.CameraSubject.Parent.Name
				end
			end
			cam.CameraType = "Follow"
		else
			spectateW.Visible = false
			spectateB.Text = "Spectate"
			cam.CameraSubject = player.Character:FindFirstChild("Humanoid")
			cam.CameraType = "Custom"
		end
	end)
 
	local left = main:WaitForChild("Left")
	local right = main:WaitForChild("Right")
 
	right.MouseButton1Down:connect(function()
		if number == #game.Players:GetPlayers() then
			number = 1
		else
			number = number + 1
		end
		for index, players in pairs(game.Players:GetPlayers()) do
			if number == index then
				local character = game.Workspace:WaitForChild(players.Name)
				cam.CameraSubject = character.Head
				name.Text = cam.CameraSubject.Parent.Name
			end
		end
	end)
 
	left.MouseButton1Down:connect(function()
		if number == 1 then
			number = #game.Players:GetPlayers()
		else
			number = number - 1
		end
		for index, players in pairs(game.Players:GetPlayers()) do
			if number == index then
				local character = game.Workspace:WaitForChild(players.Name)
				cam.CameraSubject = character.Head
				name.Text = cam.CameraSubject.Parent.Name
			end
		end
	end)
 
	main:WaitForChild("GetModel").MouseButton1Down:connect(function()
		game:service("MarketplaceService"):PromptPurchase(player, 331901306)
	end)
end
coroutine.wrap(WUORLWK_fake_script)()
local function ASUTUK_fake_script() -- nil.NameScript 
	local script = Instance.new('Script', nil)
 
	script.Parent.Name = "SpectateGui"
end
coroutine.wrap(ASUTUK_fake_script)()
