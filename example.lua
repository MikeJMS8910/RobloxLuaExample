local timeNode = 60
local currentsList = {'Intermission', 'Picking Map', 'Teleporting to', 'In Game'}
local current = 1
local map
local maps = {'Wipe Out', 'Islands'}

function getMap()
	map = maps[math.random(1, 2)]
end

function getInGamePlayers()
	local currentPlayerInLobby = game.ReplicatedStorage.InLobby[game:GetService("Players").LocalPlayer.Name]
	currentPlayerInLobby.Parent = game.ReplicatedStorage.InGame
end

function displayTick()
	timeNode -= 1
	if timeNode == 0 then
		if current == 4 then
			current = 1
			timeNode = 60
			local playersInGame = game.ReplicatedStorage.InGame:GetChildren()
			for i = 1, #playersInGame do
				local toRemove = playersInGame[1].Value
				local ReplicatedStorage = game:GetService("ReplicatedStorage")


				local TELEPORT_DESTINATION = Vector3.new(-706.328, 183.867, -450.261)
				local TELEPORT_FACE_ANGLE = 215
				local FREEZE_CHARACTER = true

				local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TP"))

				local humanoid = game.Players[toRemove].Character.Humanoid

				humanoid:SetAttribute("Teleporting", true)

				local params = {
					destination = TELEPORT_DESTINATION,
					faceAngle = TELEPORT_FACE_ANGLE,
					freeze = FREEZE_CHARACTER
				}
				TeleportWithinPlace.Teleport(humanoid, params)

				wait(1)
				humanoid:SetAttribute("Teleporting", nil)
			end
			for i = 1, #playersInGame do
				game.ReplicatedStorage.InGame[1].Parent = game.ReplicatedStorage.InLobby
			end
		else
			current += 1
			if current == 2 then
				timeNode = 15
				getMap()
			elseif current == 3 then
				timeNode = 15
			else
				if map == "Islands" then
					getInGamePlayers()
					local ReplicatedStorage = game:GetService("ReplicatedStorage")


					local TELEPORT_DESTINATION = Vector3.new(306.119, 167.346, -779.948)
					local TELEPORT_FACE_ANGLE = 0
					local FREEZE_CHARACTER = true

					local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TP"))

					local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid

					humanoid:SetAttribute("Teleporting", true)

					local params = {
						destination = TELEPORT_DESTINATION,
						faceAngle = TELEPORT_FACE_ANGLE,
						freeze = FREEZE_CHARACTER
					}
					TeleportWithinPlace.Teleport(humanoid, params)

					wait(1)
					humanoid:SetAttribute("Teleporting", nil)
					
					game.Workspace.Island.EndPart.Touched:Connect(function(other)
						if other.Parent.Humanoid then
							local ReplicatedStorage = game:GetService("ReplicatedStorage")


							local TELEPORT_DESTINATION = Vector3.new(-706.328, 183.867, -450.261)
							local TELEPORT_FACE_ANGLE = 0
							local FREEZE_CHARACTER = true

							local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TP"))

							local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid

							humanoid:SetAttribute("Teleporting", true)

							local params = {
								destination = TELEPORT_DESTINATION,
								faceAngle = TELEPORT_FACE_ANGLE,
								freeze = FREEZE_CHARACTER
							}
							TeleportWithinPlace.Teleport(humanoid, params)

							wait(1)
							humanoid:SetAttribute("Teleporting", nil)

							game.ReplicatedStorage.InGame[other.Parent.Name].Parent = game.ReplicatedStorage.InLobby
						end
					end)
				else
					getInGamePlayers()
					local ReplicatedStorage = game:GetService("ReplicatedStorage")


					local TELEPORT_DESTINATION = Vector3.new(-470.254, 169.904, 511.654)
					local TELEPORT_FACE_ANGLE = 0
					local FREEZE_CHARACTER = true

					local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TP"))

					local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid

					humanoid:SetAttribute("Teleporting", true)

					local params = {
						destination = TELEPORT_DESTINATION,
						faceAngle = TELEPORT_FACE_ANGLE,
						freeze = FREEZE_CHARACTER
					}
					TeleportWithinPlace.Teleport(humanoid, params)

					wait(1)
					humanoid:SetAttribute("Teleporting", nil)
					
					game.Workspace.WipeOut.EndPart.Touched:Connect(function(other)
						if other.Parent.Humanoid then
							local ReplicatedStorage = game:GetService("ReplicatedStorage")


							local TELEPORT_DESTINATION = Vector3.new(-706.328, 183.867, -450.261)
							local TELEPORT_FACE_ANGLE = 0
							local FREEZE_CHARACTER = true

							local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TP"))

							local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid

							humanoid:SetAttribute("Teleporting", true)

							local params = {
								destination = TELEPORT_DESTINATION,
								faceAngle = TELEPORT_FACE_ANGLE,
								freeze = FREEZE_CHARACTER
							}
							TeleportWithinPlace.Teleport(humanoid, params)

							wait(1)
							humanoid:SetAttribute("Teleporting", nil)
							
							game.ReplicatedStorage.InGame[other.Parent.Name].Parent = game.ReplicatedStorage.InLobby
						end
					end)
				end
				timeNode = 120
			end
		end
	end
	if current == 3 then
		script.Parent.Display.Text = currentsList[current].." "..map..": "..timeNode
	else
		script.Parent.Display.Text = currentsList[current]..": "..timeNode
	end
end

while true do
	wait(1)
	displayTick()
end