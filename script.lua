--[[


Welcome!
This is script for cheats





]]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local StorageName = "ArteLib_STORAGE_23491851938591347147813"
local GuiName = "ArteLib_GUI_13414893851351395"

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

local  Libary = {
	
	Themes = {
		White = {
			
			BackgroundColor = Color3.new(1, 1, 1),
			BackgroundBorderColor = Color3.new(0, 0, 0),
			
			BackgroundSecondaryColor = Color3.new(0.807843, 0.807843, 0.807843),
			ButtonBackgroundColor = Color3.new(0.886275, 0.886275, 0.886275),
			
			TextColor = Color3.new(1, 1, 1),
			TextBorderColor = Color3.new(0, 0, 0),
			
		},
		Dark = {
			
			BackgroundColor = Color3.new(0, 0, 0),
			BackgroundBorderColor = Color3.new(0.345098, 0.345098, 0.345098),

			BackgroundSecondaryColor = Color3.new(0.364706, 0.364706, 0.364706),
			ButtonBackgroundColor = Color3.new(0.239216, 0.239216, 0.239216),

			TextColor = Color3.new(0, 0, 0),
			TextBorderColor = Color3.new(1, 1, 1),
			
		},
		Blue = {
			
			BackgroundColor = Color3.new(0.145098, 0.388235, 0.780392),
			BackgroundBorderColor = Color3.new(0, 0, 0),

			BackgroundSecondaryColor = Color3.new(0.168627, 0.243137, 0.670588),
			ButtonBackgroundColor = Color3.new(0.192157, 0.262745, 0.647059),

			TextColor = Color3.new(1, 1, 1),
			TextBorderColor = Color3.new(0, 0, 0),
			
		},
		Red = {
			
			BackgroundColor = Color3.new(0.780392, 0.0705882, 0.0823529),
			BackgroundBorderColor = Color3.new(0, 0, 0),

			BackgroundSecondaryColor = Color3.new(0.658824, 0.156863, 0.164706),
			ButtonBackgroundColor = Color3.new(0.615686, 0, 0.0117647),

			TextColor = Color3.new(1, 1, 1),
			TextBorderColor = Color3.new(0, 0, 0),
			
		},
	},
	
	ToogleKey = Enum.KeyCode.Home,
	
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

function Libary:Create(options)
	
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
	}, options)
	
	local succes, error = pcall(function()
		OldGui = game:GetService("Players").LocalPlayer.PlayerGui[GuiName]
	end)
	
	if succes == false then
		local succes2, error2 = pcall(function()
			OldGui = game:GetService("CoreGui")[GuiName]
		end)
	end
	
	if OldGui then
		--OldGui:Destroy()
	end
	
	local Gui
	
	local succes, error = pcall(function()
		Gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	end)
	
	if succes == false then
		Gui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	end
	
	Gui.Name = GuiName
	Gui.DisplayOrder = 9999999999999
	Gui.ResetOnSpawn = false
	
	local MainFrame = Instance.new("Frame", Gui)
	MainFrame.Name = "MainFrame"
	MainFrame.BackgroundColor3 = options["Theme"]["BackgroundColor"]
	MainFrame.Position = UDim2.new(0, 107, 0, 64)
	MainFrame.Size = UDim2.new(0, 727, 0, 399)
	MainFrame.BackgroundTransparency = 0.25
	MainFrame.BorderSizePixel = 0
	
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
	TitleText.Text = options.Name
	TitleText.TextColor3 = options["Theme"]["TextColor"]
	TitleText.Size = UDim2.new(0.982, 0, 1, 0)
	TitleText.Position = UDim2.new(0.018, 0, 0, 0)
	TitleText.TextScaled = true
	TitleText.RichText = true
	TitleText.TextXAlignment = Enum.TextXAlignment.Left
	
	local UIStroke = Instance.new("UIStroke", TitleText)
	UIStroke.Thickness = 3
	UIStroke.Color = options["Theme"]["TextBorderColor"]
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	
	local TabsFrame = Instance.new("Frame", MainFrame)
	TabsFrame.BackgroundTransparency = 0.25
	TabsFrame.BackgroundColor3 = options["Theme"]["BackgroundSecondaryColor"]
	TabsFrame.Position = UDim2.new(0, 0, 0.211, 0)
	TabsFrame.Size = UDim2.new(0.257, 0, 0.789, 0)
	TabsFrame.BorderSizePixel = 0
	TabsFrame.Name = "Tabs"
	
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
				Callback = function() end
			}, options3)
			
			local Button = Instance.new("TextButton", TabGuiFrame)
			Button.Name = options3["Text"]
			Button.Text = options3["Text"]
			Button.Size = UDim2.new(1, 0, 0.207, 0)
			Button.TextScaled = true
			Button.BorderSizePixel = 0
			Button.RichText = true
			Button.BackgroundColor3 = options["Theme"]["ButtonBackgroundColor"]
			Button.TextColor3 = options["Theme"]["TextColor"]
			Button.ZIndex = ZIndex
			
			local UICorner = Instance.new("UICorner", Button)
			UICorner.CornerRadius = UDim.new(0, 8)

			local UIStroke = Instance.new("UIStroke", Button)
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
