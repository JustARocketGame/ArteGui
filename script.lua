--[[


Welcome!
This is script for cheats





]]--

local Simbols = {
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
	"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
	"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"!", "\"", "#", "$", "%", "&", "'", "(", ")"
}

local function RandomName()
	
	local StringLenght = math.random(6, 10)
	local String = ""
	
	for i=1, StringLenght do
		String = String.. Simbols[math.random(1, #Simbols)]
	end
	
	return String
	
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local StorageName = RandomName()

local StorageFolder = ReplicatedStorage:FindFirstChild(StorageName)
if not StorageFolder then
	StorageFolder = Instance.new("Folder", ReplicatedStorage)
	StorageFolder.Name = StorageName
end

local IsDragging = StorageFolder:FindFirstChild("IsDragging")
if not IsDragging then
	IsDragging = Instance.new("BoolValue", StorageFolder)
	IsDragging.Value = false
	IsDragging.Name = "IsDragging"
end

local SeeMessageHide = StorageFolder:FindFirstChild("SeeMessageHide")
if not SeeMessageHide then
	SeeMessageHide = Instance.new("BoolValue", StorageFolder)
	SeeMessageHide.Value = false
	SeeMessageHide.Name = "SeeMessageHide"
end

local  Libary = {

	Themes = {
		White = {

			BackgroundColor = Color3.new(0.87451, 0.87451, 0.87451),
			BackgroundBorderColor = Color3.new(0.317647, 0.317647, 0.317647),

			BackgroundSecondaryColor = Color3.new(0.807843, 0.807843, 0.807843),
			ButtonBackgroundColor = Color3.new(0.886275, 0.886275, 0.886275),

			TextColor = Color3.new(0.905882, 0.905882, 0.905882),
			TextBorderColor = Color3.new(0.203922, 0.203922, 0.203922),
			
			CheckboxOffImage = "rbxassetid://137868358915222",
			CheckboxOnImage = "rbxassetid://11856964772"

		},
		Dark = {

			BackgroundColor = Color3.new(0, 0, 0),
			BackgroundBorderColor = Color3.new(0.345098, 0.345098, 0.345098),

			BackgroundSecondaryColor = Color3.new(0.219608, 0.219608, 0.219608),
			ButtonBackgroundColor = Color3.new(0.113725, 0.113725, 0.113725),

			TextColor = Color3.new(0, 0, 0),
			TextBorderColor = Color3.new(1, 1, 1),
			
			CheckboxOffImage = "rbxassetid://137868358915222",
			CheckboxOnImage = "rbxassetid://11856964772"

		},
		Blue = {

			BackgroundColor = Color3.new(0.145098, 0.388235, 0.780392),
			BackgroundBorderColor = Color3.new(0, 0, 0),

			BackgroundSecondaryColor = Color3.new(0.168627, 0.243137, 0.670588),
			ButtonBackgroundColor = Color3.new(0.192157, 0.262745, 0.647059),

			TextColor = Color3.new(1, 1, 1),
			TextBorderColor = Color3.new(0, 0, 0),
			
			CheckboxOffImage = "rbxassetid://137868358915222",
			CheckboxOnImage = "rbxassetid://11856964772"

		},
		Red = {

			BackgroundColor = Color3.new(0.678431, 0.0627451, 0.0705882),
			BackgroundBorderColor = Color3.new(0, 0, 0),

			BackgroundSecondaryColor = Color3.new(0.407843, 0.0980392, 0.101961),
			ButtonBackgroundColor = Color3.new(0.615686, 0, 0.0117647),

			TextColor = Color3.new(1, 1, 1),
			TextBorderColor = Color3.new(0, 0, 0),
			
			CheckboxOffImage = "rbxassetid://137868358915222",
			CheckboxOnImage = "rbxassetid://11856964772"

		},
		Good = {

			BackgroundColor = Color3.fromRGB(99, 45, 133),
			BackgroundBorderColor = Color3.new(0, 0, 0),

			BackgroundSecondaryColor = Color3.fromRGB(144, 56, 116),
			ButtonBackgroundColor = Color3.fromRGB(171, 58, 118),

			TextColor = Color3.fromRGB(198, 48, 131),
			TextBorderColor = Color3.new(0, 0, 0),
			
			CheckboxOffImage = "rbxassetid://137868358915222",
			CheckboxOnImage = "rbxassetid://11856964772"

		}
	},
	
	ToogleButton = "RightShift"

}
Libary.__index = Libary

local DefaultTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

function Libary:set_defaults(defaults, options)
	defaults = defaults or {}
	options = options or {}
	for option, value in next, options do
		defaults[option] = value
	end
	return defaults
end

function Libary:Message(options)

	options = self:set_defaults({
		Title = "Message",
		MessageContent = "Hello World!"
	}, options)

	local MessageGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	MessageGui.DisplayOrder = 99999999
	MessageGui.ResetOnSpawn = false
	MessageGui.Name = RandomName()

	local MessageDefaultPosition = UDim2.new(0.782, 0, 0.709, 0)
	local MessageOutPosition = UDim2.new(1.5, 0, 0.709, 0)

	local Frame = Instance.new("Frame", MessageGui)
	Frame.BackgroundTransparency = 0.25
	Frame.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
	Frame.Position = MessageOutPosition
	Frame.Size = UDim2.new(0.238, 0, 0.255, 0)
	Frame.BorderSizePixel = 0

	local UICorner = Instance.new("UICorner", Frame)
	UICorner.CornerRadius = UDim.new(0, 8)

	local Title = Instance.new("TextLabel", Frame)
	Title.Position = UDim2.new(0.12, 0, 0, 0)
	Title.Size = UDim2.new(0.756, 0, 0.395, 0)
	Title.Text = options["Title"]
	Title.TextScaled = true
	Title.BackgroundTransparency = 1
	Title.BorderSizePixel = 0
	Title.TextColor3 = Color3.new(1, 1, 1)

	local UIStroke = Instance.new("UIStroke", Title)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	UIStroke.Thickness = 3
	UIStroke.Transparency = 0

	local MessageContent = Instance.new("TextLabel", Frame)
	MessageContent.Position = UDim2.new(0.032, 0, 0.395, 0)
	MessageContent.Size = UDim2.new(0.883, 0, 0.605, 0)
	MessageContent.Text = options["MessageContent"]
	MessageContent.TextScaled = true
	MessageContent.BackgroundTransparency = 1
	MessageContent.BorderSizePixel = 0
	MessageContent.TextColor3 = Color3.new(1, 1, 1)

	local UIStroke = Instance.new("UIStroke", MessageContent)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	UIStroke.Thickness = 3
	UIStroke.Transparency = 0

	local Tween1 = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = MessageDefaultPosition})
	local Tween2 = TweenService:Create(Frame, TweenInfo.new(1), {Position = MessageOutPosition})

	Tween1:Play()

	spawn(function()

		wait(2.5)

		Tween2:Play()
		Tween2.Completed:Wait()
		MessageGui:Destroy()

	end)

end

function Libary:Create(options)
	
	local ToogleKeycode = Enum.KeyCode[self.ToogleButton]
	
	local GuiEnabled = true
	
	self:Message({
		Title = "ArteLib",
		MessageContent = "Welcome ".. LocalPlayer.Name.. "! Press ".. self.ToogleButton.. " To Hide Gui"
	})

	local SelectedTabButton

	local OldMousePressed = false
	local MouseDragPosX
	local MouseDragPosY
	local GuiPosBeforeDrag
	local Draging = false
	local MouseOnTopFrame = false

	local MouseButtonDown = false

	Mouse.Button1Down:Connect(function()
		MouseButtonDown = true
	end)

	Mouse.Button1Up:Connect(function()
		MouseButtonDown = false
	end)

	local OldGui

	local settings = {
		Theme = "Dark"
	}

	options = self:set_defaults({
		Name = "Cheats | ".. game.PlaceId,
		Theme = self.Themes[settings.Theme],
		BackgroundGradient = 0
	}, options)
	
	local Gui

	local succes, error = pcall(function()
		Gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	end)

	if succes == false then
		Gui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	end

	Gui.Name = RandomName()
	Gui.DisplayOrder = 9999999999999
	Gui.ResetOnSpawn = false

	local MainFrame = Instance.new("Frame", Gui)
	MainFrame.Name = "MainFrame"
	MainFrame.BackgroundColor3 = options["Theme"]["BackgroundColor"]
	MainFrame.Position = UDim2.new(0, 107, 0, 64)
	MainFrame.Size = UDim2.new(0, 727, 0, 399)
	MainFrame.BackgroundTransparency = 0.25
	MainFrame.BorderSizePixel = 0

	local HasGradient = false

	if options["BackgroundGradient"] > 0 then
		HasGradient = options["BackgroundGradient"]
	end

	--[[if HasGradient then
		
		local Color = options["Theme"]["BackgroundColor"]
		Color = Color3.new(Color.R * 255, Color.G * 255, Color.B * 255)
		
		local UIGradient = Instance.new("UIGradient", MainFrame)
		UIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color),
			ColorSequenceKeypoint.new(1, Color - Color3.fromRGB(HasGradient, HasGradient, HasGradient))
		})
		
	end]]--

	if HasGradient then
		local Color = options["Theme"]["BackgroundColor"]
		Color = Color3.new(Color.R, Color.G, Color.B) -- Убедимся, что Color уже в формате Color3

		-- Вычисляем второй цвет для градиента (например, затемняем)
		local DarkerColor = Color3.fromRGB(
			math.clamp(Color.R * 255 - HasGradient, 0, 255), -- Уменьшаем R
			math.clamp(Color.G * 255 - HasGradient, 0, 255), -- Уменьшаем G
			math.clamp(Color.B * 255 - HasGradient, 0, 255)  -- Уменьшаем B
		)

		local UIGradient = Instance.new("UIGradient", MainFrame)
		UIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color),
			ColorSequenceKeypoint.new(1, DarkerColor)
		})
	end

	local UICorner = Instance.new("UICorner", MainFrame)
	UICorner.CornerRadius = UDim.new(0, 8)

	local UIStroke = Instance.new("UIStroke", MainFrame)
	UIStroke.Thickness = 3
	UIStroke.Color = options["Theme"]["BackgroundBorderColor"]

	local TopFrame = Instance.new("Frame", MainFrame)
	TopFrame.Name = "TopFrame"
	TopFrame.BackgroundColor3 = options["Theme"]["BackgroundColor"]
	TopFrame.BackgroundTransparency = 0.25
	TopFrame.BorderSizePixel = 0
	TopFrame.Position = UDim2.new(0, 0, 0, 0)
	TopFrame.Size = UDim2.new(1, 0, 0.211, 0)

	if HasGradient then
		local Color = options["Theme"]["BackgroundColor"]
		Color = Color3.new(Color.R, Color.G, Color.B) -- Убедимся, что Color уже в формате Color3

		-- Вычисляем второй цвет для градиента (например, затемняем)
		local DarkerColor = Color3.fromRGB(
			math.clamp(Color.R * 255 - HasGradient, 0, 255), -- Уменьшаем R
			math.clamp(Color.G * 255 - HasGradient, 0, 255), -- Уменьшаем G
			math.clamp(Color.B * 255 - HasGradient, 0, 255)  -- Уменьшаем B
		)

		local UIGradient = Instance.new("UIGradient", TopFrame)
		UIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color),
			ColorSequenceKeypoint.new(1, DarkerColor)
		})
	end

	TopFrame.MouseEnter:Connect(function()
		MouseOnTopFrame = true
	end)

	TopFrame.MouseLeave:Connect(function()
		MouseOnTopFrame = false
	end)

	local UICorner = Instance.new("UICorner", TopFrame)
	UICorner.CornerRadius = UDim.new(0, 8)

	local UIStroke = Instance.new("UIStroke", TopFrame)
	UIStroke.Thickness = 3
	UIStroke.Color = options["Theme"]["BackgroundBorderColor"]

	local TitleText = Instance.new("TextLabel", TopFrame)
	TitleText.BackgroundTransparency = 1
	TitleText.Text = options.Name.. " (Using as ".. LocalPlayer.Name.. ")"
	TitleText.TextColor3 = options["Theme"]["TextColor"]
	TitleText.Size = UDim2.new(0.881, 0, 1, 0)
	TitleText.Position = UDim2.new(0.018, 0, 0, 0)
	TitleText.TextScaled = true
	TitleText.RichText = true
	TitleText.TextXAlignment = Enum.TextXAlignment.Left

	local UIStroke = Instance.new("UIStroke", TitleText)
	UIStroke.Thickness = 3
	UIStroke.Color = options["Theme"]["TextBorderColor"]
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

	local PlayerImage = Instance.new("ImageLabel", TopFrame)
	PlayerImage.Name = "PlayerImage"
	PlayerImage.BorderSizePixel = 0
	PlayerImage.Size = UDim2.new(0.118, 0, 0.998)
	PlayerImage.Position = UDim2.new(0.881, 0, 0, 0)
	PlayerImage.BackgroundTransparency = 1

	local UICorner = Instance.new("UICorner", PlayerImage)
	UICorner.CornerRadius = UDim.new(1, 0)

	local ImageSize = Enum.ThumbnailSize.Size420x420
	local ImageType = Enum.ThumbnailType.HeadShot

	local content = Players:GetUserThumbnailAsync(LocalPlayer.UserId, ImageType, ImageSize)

	PlayerImage.Image = content

	local TabsFrame = Instance.new("Frame", MainFrame)
	TabsFrame.BackgroundTransparency = 0.25
	TabsFrame.BackgroundColor3 = options["Theme"]["BackgroundSecondaryColor"]
	TabsFrame.Position = UDim2.new(0, 0, 0.211, 0)
	TabsFrame.Size = UDim2.new(0.257, 0, 0.789, 0)
	TabsFrame.BorderSizePixel = 0
	TabsFrame.Name = "Tabs"

	if HasGradient then
		local Color = options["Theme"]["BackgroundSecondaryColor"]
		Color = Color3.new(Color.R, Color.G, Color.B) -- Убедимся, что Color уже в формате Color3

		-- Вычисляем второй цвет для градиента (например, затемняем)
		local DarkerColor = Color3.fromRGB(
			math.clamp(Color.R * 255 - HasGradient + 25, 0, 255), -- Уменьшаем R
			math.clamp(Color.G * 255 - HasGradient + 25, 0, 255), -- Уменьшаем G
			math.clamp(Color.B * 255 - HasGradient + 25, 0, 255)  -- Уменьшаем B
		)

		local UIGradient = Instance.new("UIGradient", TabsFrame)
		UIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, DarkerColor),
			ColorSequenceKeypoint.new(1, Color)
		})
	end

	local TabsFrame2 = Instance.new("Frame", TabsFrame)
	TabsFrame2.BackgroundTransparency = 1
	TabsFrame2.Position = UDim2.new(0.082, 0, 0.041, 0)
	TabsFrame2.Size = UDim2.new(0.833, 0, 0.959, 0)
	TabsFrame2.BorderSizePixel = 0

	local UIListLayout = Instance.new("UIListLayout", TabsFrame2)
	UIListLayout.Padding = UDim.new(0, 10)

	local TabGui = Instance.new("Frame", MainFrame)
	TabGui.Name = "TabGui"
	TabGui.BackgroundTransparency = 1
	TabGui.Position = UDim2.new(0.272, 0, 0.243, 0)
	TabGui.Size = UDim2.new(0.715, 0, 0.737, 0)

	spawn(function()
		while task.wait() do

			if MouseButtonDown == true then
				if OldMousePressed == false and MouseOnTopFrame == true  and IsDragging.Value == false then

					OldMousePressed = true
					Draging = true
					IsDragging.Value = true

					MouseDragPosX = Mouse.X
					MouseDragPosY = Mouse.Y

					GuiPosBeforeDrag = MainFrame.Position

				end
			else

				OldMousePressed = false
				Draging = false
				IsDragging.Value = false

				MouseDragPosX = nil
				MouseDragPosY = nil

				GuiPosBeforeDrag = nil

			end

		end
	end)

	spawn(function()
		while task.wait() do
			if Draging == true then
				if MouseDragPosX and MouseDragPosY and MouseButtonDown and GuiPosBeforeDrag and Gui then

					local NewX = GuiPosBeforeDrag.X.Offset +  Mouse.X - MouseDragPosX
					local NewY = GuiPosBeforeDrag.Y.Offset + Mouse.Y - MouseDragPosY

					local Tween = TweenService:Create(MainFrame, DefaultTweenInfo, {Position = UDim2.new(0, NewX, 0, NewY)})
					Tween:Play()

				end
			end
		end
	end)
	
	UserInputService.InputBegan:Connect(function(Input, Processed)
		if Input.KeyCode == ToogleKeycode then
			
			GuiEnabled = not GuiEnabled
			Gui.Enabled = GuiEnabled
			
			if GuiEnabled == false then
				if SeeMessageHide.Value == false then
					
					SeeMessageHide.Value = true
					self:Message({
						Title = "ArteLib",
						MessageContent = "Press ".. self.ToogleButton.. " To Enable Gui"
					})
					
				end
			end
			
		end
	end)

	local methods = {}

	function methods:Hide()
		Gui.Enabled = false
	end

	function methods:Show()
		Gui.Enabled = true
	end

	function methods:Gui()
		return Gui
	end

	function methods:set_defaults2(defaults, options2)
		defaults = defaults or {}
		options2 = options2 or {}
		for option, value in next, options2 do
			defaults[option] = value
		end
		return defaults
	end

	function methods:Tab(options2)

		local ZIndex = 9999

		options2 = methods:set_defaults2({
			Name = "New Tab"
		}, options2)

		local NewTab = Instance.new("TextButton", TabsFrame2)
		NewTab.Name = "Tab_".. options2["Name"]
		NewTab.Text = options2["Name"]
		NewTab.BackgroundTransparency = 0.25
		NewTab.BackgroundColor3 = options["Theme"]["ButtonBackgroundColor"]
		NewTab.Size = UDim2.new(1, 0, 0.119, 0)
		NewTab.TextScaled = true
		NewTab.RichText = true
		NewTab.BorderSizePixel = 0
		NewTab.TextColor3 = options["Theme"]["TextColor"]

		local UICorner = Instance.new("UICorner", NewTab)
		UICorner.CornerRadius = UDim.new(0, 8)

		local UIStroke = Instance.new("UIStroke", NewTab)
		UIStroke.Thickness = 3
		UIStroke.Color = options["Theme"]["TextBorderColor"]
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

		local UIStroke = Instance.new("UIStroke", NewTab)
		UIStroke.Thickness = 3
		UIStroke.Color = options["Theme"]["BackgroundBorderColor"]
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

		local TabGuiFrame  = Instance.new("Frame", TabGui)
		TabGuiFrame.Name = NewTab.Text
		TabGuiFrame.Position = UDim2.new(0, 0, 0, 0)
		TabGuiFrame.Size = UDim2.new(1, 0, 1, 0)
		TabGuiFrame.Transparency = 1

		local UIListLayout = Instance.new("UIListLayout", TabGuiFrame)
		UIListLayout.Padding = UDim.new(0, 10)
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		if TabGuiFrame.Name ~= SelectedTabButton then
			TabGuiFrame.Visible = false
		end

		NewTab.MouseButton1Up:Connect(function()

			SelectedTabButton = NewTab.Text

			local TabGuiFrame = TabGui:FindFirstChild(NewTab.Text)
			if TabGuiFrame then

				for index, frame in pairs(TabGui:GetChildren()) do
					if frame then
						frame.Visible = false
					end
				end

				TabGuiFrame.Visible = true

			end

		end)

		local methods2 = {}

		function methods2:TabButton()
			return NewTab
		end

		function methods2:TabGui()
			return TabGuiFrame
		end

		function methods2:Button(options3)

			ZIndex -= 1

			options3 = methods:set_defaults2({
				Text = "Button",
				Callback = function() print("Button pressed!") end
			}, options3)

			local Button = Instance.new("TextButton", TabGuiFrame)
			Button.Name = options3["Text"]
			Button.Text = ""
			Button.Size = UDim2.new(1, 0, 0.207, 0)
			Button.BorderSizePixel = 0
			Button.BackgroundColor3 = options["Theme"]["ButtonBackgroundColor"]
			Button.ZIndex = ZIndex
			
			local TextLabel = Instance.new("TextLabel", Button)
			TextLabel.Position = UDim2.new(0.019, 0, 0.23, 0)
			TextLabel.Size = UDim2.new(0.837, 0, 0.624, 0)
			TextLabel.Text = options3["Text"]
			TextLabel.TextScaled = true
			TextLabel.BorderSizePixel = 0
			TextLabel.RichText = true
			TextLabel.TextColor3 = options["Theme"]["TextColor"]
			TextLabel.BackgroundTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.ZIndex = ZIndex + 1

			local UICorner = Instance.new("UICorner", Button)
			UICorner.CornerRadius = UDim.new(0, 8)

			local UIStroke = Instance.new("UIStroke", TextLabel)
			UIStroke.Thickness = 3
			UIStroke.Color = options["Theme"]["TextBorderColor"]
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

			local UIStroke = Instance.new("UIStroke", Button)
			UIStroke.Thickness = 3
			UIStroke.Color = options["Theme"]["BackgroundBorderColor"]
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Button.MouseButton1Up:Connect(function()
				options3["Callback"]()
			end)

			return Button

		end
		
		function methods2:Toogle(options3)

			ZIndex -= 1

			options3 = methods:set_defaults2({
				Text = "Button",
				Value = false,
				Callback = function() print("Button pressed!") end
			}, options3)

			local Button = Instance.new("TextButton", TabGuiFrame)
			Button.Name = options3["Text"]
			Button.Text = ""
			Button.Size = UDim2.new(1, 0, 0.207, 0)
			Button.BorderSizePixel = 0
			Button.BackgroundColor3 = options["Theme"]["ButtonBackgroundColor"]
			Button.ZIndex = ZIndex

			local TextLabel = Instance.new("TextLabel", Button)
			TextLabel.Position = UDim2.new(0.019, 0, 0.23, 0)
			TextLabel.Size = UDim2.new(0.837, 0, 0.624, 0)
			TextLabel.Text = options3["Text"]
			TextLabel.TextScaled = true
			TextLabel.BorderSizePixel = 0
			TextLabel.RichText = true
			TextLabel.TextColor3 = options["Theme"]["TextColor"]
			TextLabel.BackgroundTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.ZIndex = ZIndex + 1

			local UICorner = Instance.new("UICorner", Button)
			UICorner.CornerRadius = UDim.new(0, 8)

			local UIStroke = Instance.new("UIStroke", TextLabel)
			UIStroke.Thickness = 3
			UIStroke.Color = options["Theme"]["TextBorderColor"]
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

			local UIStroke = Instance.new("UIStroke", Button)
			UIStroke.Thickness = 3
			UIStroke.Color = options["Theme"]["BackgroundBorderColor"]
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			
			local ValueImage = Instance.new("ImageLabel", Button)
			ValueImage.BackgroundTransparency = 1
			ValueImage.ZIndex = ZIndex + 1
			ValueImage.Position = UDim2.new(0.898, 0, 0.181, 0)
			ValueImage.Size = UDim2.new(0.073, 0, 0.624, 0)
			
			local UICorner = Instance.new("UICorner", ValueImage)
			UICorner.CornerRadius = UDim.new(0, 8)
			
			spawn(function()
				while task.wait() do
					if options3["Value"] == false then
						ValueImage.Image = options["Theme"]["CheckboxOffImage"]
					else
						ValueImage.Image = options["Theme"]["CheckboxOnImage"]
					end
				end
			end)

			Button.MouseButton1Up:Connect(function()
				options3["Value"] = not options3["Value"]
				options3["Callback"]()
			end)

			return Button

		end

		function methods2:Label(options3)

			ZIndex -= 1

			options3 = methods:set_defaults2({
				Text = "Button"
			}, options3)

			local Label = Instance.new("TextLabel", TabGuiFrame)
			Label.Text = options3["Text"]
			Label.Name = options3["Text"]
			Label.BackgroundTransparency = 1
			Label.Size = UDim2.new(1, 0, 0.207, 0)
			Label.TextScaled = true
			Label.RichText = true
			Label.BackgroundColor3 = options["Theme"]["ButtonBackgroundColor"]
			Label.TextColor3 = options["Theme"]["TextColor"]
			Label.ZIndex = ZIndex

			local UIStroke = Instance.new("UIStroke", Label)
			UIStroke.Thickness = 3
			UIStroke.Color = options["Theme"]["TextBorderColor"]
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

		end

		return methods2

	end

	SelectedTabButton = "Home"

	local HomeTab = methods:Tab({
		Name = "Home"
	})

	HomeTab:Label({
		Text = "Welcome ".. LocalPlayer.DisplayName.. "!"
	})

	HomeTab:Label({
		Text = "Change Tabs In The Left Bar"
	})

	return methods

end

return setmetatable(Libary, {
	__index = function(_, i)
		return rawget(Libary, i:lower())
	end
})
