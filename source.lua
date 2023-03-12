local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local Window = DiscordLib:Window("NextHUB")

local Server = Window:Server("NextHUB", '')

local Main = Server:Channel("Login")

local data = {
   InputtedKey = '',
   Key = 'NEXTHUB-FIFE-FDNH-FSA4-FDQE'
}

Main:Textbox("Key", "Key Here", false, function(t)
	data.InputtedKey = t
end)


Main:Button("Submit", function()
	if (data.InputtedKey == data.Key) then
       DiscordLib:Notification("Success!", "You can now use this script, awesome right?", "Continue")
       local MainScriptChannel = Server:Channel("Client")
       local WSEnabled = true
       MainScriptChannel:Toggle("SpeedEnabled", true, function(v)
       	   WSEnabled = v	
       end)
       MainScriptChannel:Slider("Walkspeed", 0, 50, 20, function(t)
           	if (WSEnabled == true) then
           		while wait(0) do
           			if (WSEnabled == false) then
           				return
					end
					if (t == not game.Players.LocalPlayer.Character.Humanoid.WalkSpeed) then
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
						return
					end
           			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
				end
			end
       end)
       MainScriptChannel:Slider("Jumppower", 0, 150, 50, function(t)
       	    while wait(0) do
       	    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
			end
       	end)
	end
end)

Main:Seperator()

Main:Button("Get Key", function()
   setclipboard('https://link-center.net/428682/nexthub')
   DiscordLib:Notification("Link Copied", "The link is copied, paste it in your browser", "Alright!")
end)
