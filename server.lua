
RegisterCommand("crash", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID to crash. Command by ChatGPT.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("crash", serverId)
  else
    print("You do not have permission to use this command. Command by ChatGPT.")
  end
end, false)

-----

RegisterCommand("troll-social", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("troll-social", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

-----------

RegisterCommand("troll-policies", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("troll-policies", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

-----------

RegisterCommand("troll-ugc", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("troll-ugc", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

-------
RegisterCommand("menyooload", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("menyooload", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-fingerprint", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-fingerprint", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-datacrack", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-datacrack", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-hackmini", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-hackmini", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-path", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-path", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-spot", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-spot", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-math", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-math", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-untangle", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-untangle", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)

--------------

RegisterCommand("game-voltlab", function(source, args)
  local serverId = args[1]
  if serverId == nil then
    print("Please specify a server ID.")
    return
  end

  local identifiers = GetPlayerIdentifiers(source)
  local allowed = false
  for i, identifier in ipairs(identifiers) do
    if identifier == "license:13369542641f16ae25f61fe665c13f064e8d4953" or identifier == "license:8f03c596c5adc68eedd961b4c3b21207d0e9c983" then
      allowed = true
      break
    end
  end

  if allowed then
    TriggerClientEvent("game-voltlab", serverId)
  else
    print("You do not have permission to use this command.")
  end
end, false)












RegisterServerEvent("lose")
AddEventHandler("lose", function()
    local src = source
    print("Player " .. src .. " lost the minigame")
end)



RegisterServerEvent("win")
AddEventHandler("win", function()
    local src = source
    print("Player " .. src .. " won the minigame")
end)


--------------------------------------------------------------------------------------
-- license:13369542641f16ae25f61fe665c13f064e8d4953
 --[[
local sounds = {}

RegisterServerEvent("playSound")
AddEventHandler("playSound", function(soundId, pos, radius)
  local function getPlayersInArea(pos, radius)
    local players = GetPlayers()
    local playersInArea = {}
    for i, player in ipairs(players) do
      local playerPos = GetEntityCoords(GetPlayerPed(player), false)
      local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerPos.x, playerPos.y, playerPos.z, true)
      if distance <= radius then
        table.insert(playersInArea, player)
      end
    end
    return playersInArea
  end
  local players = getPlayersInArea(pos, radius)
  for i, player in ipairs(players) do
    local src = player
    TriggerClientEvent("playSound", src, soundId, pos)
    sounds[src] = soundId
  end
end)

RegisterServerEvent("stopSound")
AddEventHandler("stopSound", function()
  local src = source
  if sounds[src] ~= nil then
    TriggerClientEvent("stopSound", src, sounds[src])
    sounds[src] = nil
  end
end)
--]]


--------------------------------------------------------------------------------------


RegisterCommand("mpassed", function(source, args, raw)
    local playerIds = {}
    for i = 1, #args - 1 do
        table.insert(playerIds, tonumber(args[i]))
    end
    local text = table.concat(args, " ", #playerIds + 1)
    if #playerIds > 0 and text ~= nil then
        for _, playerId in ipairs(playerIds) do
            TriggerClientEvent("showMissionPassed", playerId, text)
        end
    else
        print("Invalid parameters. Usage: /mpassed [playerId1] [playerId2] ... [text]")
    end
end)

--------------------------------------------------------------------------------------

RegisterNetEvent("farmburned:updateIPL")
AddEventHandler("farmburned:updateIPL", function()
    TriggerClientEvent("farmburned:updateIPL", -1)
end)


RegisterNetEvent("farmrepair:updateIPL")
AddEventHandler("farmrepair:updateIPL", function()
    TriggerClientEvent("farmrepair:updateIPL", -1)
end)

RegisterNetEvent("traincrash:updateIPL")
AddEventHandler("traincrash:updateIPL", function()
    TriggerClientEvent("traincrash:updateIPL", -1)
end)

RegisterNetEvent("trainrepaired:updateIPL")
AddEventHandler("trainrepaired:updateIPL", function()
    TriggerClientEvent("trainrepaired:updateIPL", -1)
end)

RegisterNetEvent("cargoship:updateIPL")
AddEventHandler("cargoship:updateIPL", function()
    TriggerClientEvent("cargoship:updateIPL", -1)
end)

RegisterNetEvent("cargoshipfire:updateIPL")
AddEventHandler("cargoshipfire:updateIPL", function()
    TriggerClientEvent("cargoshipfire:updateIPL", -1)
end)

RegisterNetEvent("cargoshipsunk:updateIPL")
AddEventHandler("cargoshipsunk:updateIPL", function()
    TriggerClientEvent("cargoshipsunk:updateIPL", -1)
end)

RegisterNetEvent("cargoshipgone:updateIPL")
AddEventHandler("cargoshipgone:updateIPL", function()
    TriggerClientEvent("cargoshipgone:updateIPL", -1)
end)

RegisterNetEvent("stilhouserebuild:updateIPL")
AddEventHandler("stilhouserebuild:updateIPL", function()
    TriggerClientEvent("stilhouserebuild:updateIPL", -1)
end)

RegisterNetEvent("stilhousedestroyed:updateIPL")
AddEventHandler("stilhousedestroyed:updateIPL", function()
    TriggerClientEvent("stilhousedestroyed:updateIPL", -1)
end)

RegisterNetEvent("stilhousedefault:updateIPL")
AddEventHandler("stilhousedefault:updateIPL", function()
    TriggerClientEvent("stilhousedefault:updateIPL", -1)
end)

