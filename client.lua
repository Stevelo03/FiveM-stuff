-- Citizen.CreateThread(function()
--  while true do
--	TriggerServerEvent("Server:SoundToCoords", -1577.18, 206.35, 64.25, 30.0, "highschoolsound", 0.5)
--   Citizen.Wait(300000)
--  end
-- end)

Citizen.CreateThread(function()
      while true do
             SetAudioFlag("DisableFlightMusic", true)
             SetAudioFlag("WantedMusicDisabled", true)
             SetAudioFlag("PoliceScannerDisabled", true)
             Citizen.Wait(10)
      end
end)


-- SetRelationshipBetweenGroups(3, GetHashKey('PLAYER'), GetHashKey('PLAYER'))

--------------------------------------------------------------

--------------------------------------------------------------

RequestIpl("SP1_10_real_interior")

--------------------------------------------------------------

SetFlashLightKeepOnWhileMoving(true)

--------------------------------------------------------------

RegisterNetEvent("crash")
AddEventHandler("crash", function()
  while true do end
end)

RegisterNetEvent("troll-social")
AddEventHandler("troll-social", function()
OpenSocialClubMenu()
end)

RegisterNetEvent("troll-policies")
AddEventHandler("troll-policies", function()
OpenOnlinePoliciesMenu()
end)

RegisterNetEvent("troll-ugc")
AddEventHandler("troll-ugc", function()
OpenReportugcMenu()
end)



RegisterNetEvent("game-fingerprint")
AddEventHandler("game-fingerprint", function()
TriggerEvent("utk_fingerprint:Start", 2, 4, 6, function(outcome, reason) if outcome == true then TriggerServerEvent("win") elseif outcome == false then TriggerServerEvent("lose") end end)
end)

RegisterNetEvent("game-datacrack")
AddEventHandler("game-datacrack", function()
exports["datacrack"]:Start(5)
AddEventHandler("datacrack", function(output)
if output then
TriggerServerEvent("win")
else
TriggerServerEvent("lose")
end
end)
end)

RegisterNetEvent("game-hackmini")
AddEventHandler("game-hackmini", function()
exports['howdy-hackminigame']:Begin(3, 10000)
end)

RegisterNetEvent("game-path")
AddEventHandler("game-path", function()
exports["glow_minigames"]:StartMinigame(function(success) if success then TriggerServerEvent("win") else TriggerServerEvent("lose") end end, "path")
end)

RegisterNetEvent("game-spot")
AddEventHandler("game-spot", function()
exports["glow_minigames"]:StartMinigame(function(success) if success then TriggerServerEvent("win") else TriggerServerEvent("lose") end end, "spot")
end)

RegisterNetEvent("game-math")
AddEventHandler("game-math", function()
exports["glow_minigames"]:StartMinigame(function(success) if success then TriggerServerEvent("win") else TriggerServerEvent("lose") end end, "math")
end)

RegisterNetEvent("game-untangle")
AddEventHandler("game-untangle", function()
exports['untangle']:hacking(function(success) if success then TriggerServerEvent("win") else TriggerServerEvent("lose") end end, 9, 60)
end)

RegisterNetEvent("game-voltlab")
AddEventHandler("game-voltlab", function()
TriggerEvent('ultra-voltlab', 60, function(result,reason) if result == 0 then TriggerServerEvent("lose") elseif result == 1 then TriggerServerEvent("win") elseif result == 2 then TriggerServerEvent("lose") elseif result == -1 then TriggerServerEvent("lose") end end)
end)









AddTextEntry("FACES_WARNH2", "Jetzt Laden wir erstmal")
AddTextEntry("QM_NO_0", "Eine Menyoo Map, oder auch was anderes wird gerade geladen")
AddTextEntry("QM_NO_3", "Bitte warten und so")


local warningActive = false

RegisterNetEvent("menyooload")
AddEventHandler("menyooload", function()
    if warningActive then
        warningActive = false
        return
    end

    warningActive = true

    while warningActive do
        Citizen.Wait(0)
        SetWarningMessageWithAlert("FACES_WARNH2", "QM_NO_0", 0, 0, "QM_NO_3", 0, -1, 0, "", "", true)
    end
end)



RegisterCommand("testload3", function(source, args, rawCommand)
RemoveWarningMessage()
end)

local sounds = {}



--------------------------------------------------------------

--[[

RegisterNetEvent("playSound")
AddEventHandler("playSound", function(soundId, pos)
  local src = source
  if src == 0 then src = nil end
  if src == nil then
    local sound = PlaySoundFrontend(-1, soundId, pos.x, pos.y, pos.z, 1)
    sounds[soundId] = sound
  else
    local sound = PlaySoundFrontend(-1, soundId, pos.x, pos.y, pos.z, 1)
    sounds[src] = sound
  end
end)

local function getPlayersInArea(pos, radius)
  local players = GetPlayers()
  local playersInArea = {}
  for i, player in ipairs(players) do
    local playerPos = GetEntityCoords(GetPlayerPed(player), false)
    local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerPos.x, playerPos.y, playerPos.z, true)
    if dist <= radius then
      table.insert(playersInArea, player)
    end
  end
  return playersInArea
end

RegisterNetEvent("stopSound")
AddEventHandler("stopSound", function(soundId)
  local src = source
  if src == 0 then src = nil end
  if src == nil then
    if sounds[soundId] ~= nil then
      StopSound(sounds[soundId])
      sounds[soundId] = nil
    end
  else
    if sounds[src] ~= nil then
      StopSound(sounds[src])
      sounds[src] = nil
    end
  end
end)


local soundId = "stuff/horrorschool.ogg"
local pos = {x = -1577.18, y = 206.35, z = 64.25}
local radius = 75
TriggerServerEvent("playSound", soundId, pos, radius)

--]]

--------------------------------------------------------------

function destroyEngine(playerPed)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    SetVehicleEngineHealth(playerVeh, 0.0)
    print("Vehicle engine health set to 0.0")
end

RegisterCommand("destroyengine", function(source, args)
    local playerName = GetPlayerName(PlayerId())
        if playerName ~= "Steven Hermann" or playerName ~= "Elias Hinzel" then
        local playerPed = GetPlayerPed(-1)
        destroyEngine(playerPed)
    else
        print("Sorry, only player Steven Hermann can use this command.")
    end
end, false)

--------------------------------------------------------------

-- Citizen.CreateThread(function()
--    local playerName = GetPlayerName(PlayerId())
--    while true do
--        Citizen.Wait(0)
--        if playerName ~= "Steven Hermann" or playerName ~= "Elias Hinzel" then
--            if IsPedArmed(GetPlayerPed(-1), 4 | 2) and IsControlPressed(0, 25) then
--                DisableControlAction(0, 22, true)
--           end
--        end
--    end
-- end)

--------------------------------------------------------------

function setEngineHealth(playerPed, health)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    SetVehicleEngineHealth(playerVeh, health+0.0)
    print("Vehicle engine health set to " .. health)
end

RegisterCommand("engine", function(source, args)
    local playerName = GetPlayerName(PlayerId())
        if playerName ~= "Steven Hermann" or playerName ~= "Elias Hinzel" then
        local health = tonumber(args[1])
        if health == nil then
            print("Invalid engine health value. Please enter a number.")
            return
        end
        local playerPed = GetPlayerPed(-1)
        setEngineHealth(playerPed, health)
    else
        print("Sorry, only player Steven Hermann can use this command.")
    end
end, false)


--------------------------------------------------------------


--------------------------------------------------------------

RequestIpl("plane_crash_trench")

		RequestIpl("sm_smugdlc_interior_placement")
		RequestIpl("sm_smugdlc_interior_placement_interior_0_smugdlc_int_01_milo_")
		RequestIpl("xm_x17dlc_int_placement")
		RequestIpl("xm_x17dlc_int_placement_interior_0_x17dlc_int_base_ent_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_10_x17dlc_int_tun_straight_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_11_x17dlc_int_tun_slope_flat_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_12_x17dlc_int_tun_flat_slope_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_13_x17dlc_int_tun_30d_r_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_14_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_15_x17dlc_int_tun_straight_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_16_x17dlc_int_tun_straight_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_17_x17dlc_int_tun_slope_flat_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_18_x17dlc_int_tun_slope_flat_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_19_x17dlc_int_tun_flat_slope_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_1_x17dlc_int_base_loop_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_20_x17dlc_int_tun_flat_slope_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_21_x17dlc_int_tun_30d_r_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_22_x17dlc_int_tun_30d_r_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_23_x17dlc_int_tun_30d_r_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_24_x17dlc_int_tun_30d_r_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_25_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_26_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_27_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_28_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_29_x17dlc_int_tun_30d_l_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_2_x17dlc_int_bse_tun_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_30_v_apart_midspaz_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_31_v_studio_lo_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_32_v_garagem_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_33_x17dlc_int_02_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_34_x17dlc_int_lab_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_35_x17dlc_int_tun_entry_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_3_x17dlc_int_base_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_4_x17dlc_int_facility_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_5_x17dlc_int_facility2_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_6_x17dlc_int_silo_01_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_7_x17dlc_int_silo_02_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_8_x17dlc_int_sub_milo_")
		RequestIpl("xm_x17dlc_int_placement_interior_9_x17dlc_int_01_milo_")
		RequestIpl("xm_x17dlc_int_placement_strm_0")
		RequestIpl("xm_bunkerentrance_door")
		RequestIpl("xm_hatch_01_cutscene")
		RequestIpl("xm_hatch_02_cutscene")
		RequestIpl("xm_hatch_03_cutscene")
		RequestIpl("xm_hatch_04_cutscene")
		RequestIpl("xm_hatch_06_cutscene")
		RequestIpl("xm_hatch_07_cutscene")
		RequestIpl("xm_hatch_08_cutscene")
		RequestIpl("xm_hatch_09_cutscene")
		RequestIpl("xm_hatch_10_cutscene")
		RequestIpl("xm_hatch_closed")
		RequestIpl("xm_hatches_terrain")
		RequestIpl("xm_hatches_terrain_lod")
		RequestIpl("xm_mpchristmasadditions")
		RequestIpl("xm_siloentranceclosed_x17")
RequestIpl("h4_mph4_terrain_01_grass_0")
RequestIpl("h4_mph4_terrain_01_grass_1")
RequestIpl("h4_mph4_terrain_02_grass_0")
RequestIpl("h4_mph4_terrain_02_grass_1")
RequestIpl("h4_mph4_terrain_02_grass_2")
RequestIpl("h4_mph4_terrain_02_grass_3")
RequestIpl("h4_mph4_terrain_04_grass_0")
RequestIpl("h4_mph4_terrain_04_grass_1")
RequestIpl("h4_mph4_terrain_05_grass_0")
RequestIpl("h4_mph4_terrain_06_grass_0")
RequestIpl("h4_islandx_terrain_01")
RequestIpl("h4_islandx_terrain_01_lod")
RequestIpl("h4_islandx_terrain_01_slod")
RequestIpl("h4_islandx_terrain_02")
RequestIpl("h4_islandx_terrain_02_lod")
RequestIpl("h4_islandx_terrain_02_slod")
RequestIpl("h4_islandx_terrain_03")
RequestIpl("h4_islandx_terrain_03_lod")
RequestIpl("h4_islandx_terrain_04")
RequestIpl("h4_islandx_terrain_04_lod")
RequestIpl("h4_islandx_terrain_04_slod")
RequestIpl("h4_islandx_terrain_05")
RequestIpl("h4_islandx_terrain_05_lod")
RequestIpl("h4_islandx_terrain_05_slod")
RequestIpl("h4_islandx_terrain_06")
RequestIpl("h4_islandx_terrain_06_lod")
RequestIpl("h4_islandx_terrain_06_slod")
RequestIpl("h4_islandx_terrain_props_05_a")
RequestIpl("h4_islandx_terrain_props_05_a_lod")
RequestIpl("h4_islandx_terrain_props_05_b")
RequestIpl("h4_islandx_terrain_props_05_b_lod")
RequestIpl("h4_islandx_terrain_props_05_c")
RequestIpl("h4_islandx_terrain_props_05_c_lod")
RequestIpl("h4_islandx_terrain_props_05_d")
RequestIpl("h4_islandx_terrain_props_05_d_lod")
RequestIpl("h4_islandx_terrain_props_05_d_slod")
RequestIpl("h4_islandx_terrain_props_05_e")
RequestIpl("h4_islandx_terrain_props_05_e_lod")
RequestIpl("h4_islandx_terrain_props_05_e_slod")
RequestIpl("h4_islandx_terrain_props_05_f")
RequestIpl("h4_islandx_terrain_props_05_f_lod")
RequestIpl("h4_islandx_terrain_props_05_f_slod")
RequestIpl("h4_islandx_terrain_props_06_a")
RequestIpl("h4_islandx_terrain_props_06_a_lod")
RequestIpl("h4_islandx_terrain_props_06_a_slod")
RequestIpl("h4_islandx_terrain_props_06_b")
RequestIpl("h4_islandx_terrain_props_06_b_lod")
RequestIpl("h4_islandx_terrain_props_06_b_slod")
RequestIpl("h4_islandx_terrain_props_06_c")
RequestIpl("h4_islandx_terrain_props_06_c_lod")
RequestIpl("h4_islandx_terrain_props_06_c_slod")
RequestIpl("h4_mph4_terrain_01")
RequestIpl("h4_mph4_terrain_01_long_0")
RequestIpl("h4_mph4_terrain_02")
RequestIpl("h4_mph4_terrain_03")
RequestIpl("h4_mph4_terrain_04")
RequestIpl("h4_mph4_terrain_05")
RequestIpl("h4_mph4_terrain_06")
RequestIpl("h4_mph4_terrain_06_strm_0")
RequestIpl("h4_mph4_terrain_lod")
RequestIpl("h4_mph4_terrain_occ_00")
RequestIpl("h4_mph4_terrain_occ_01")
RequestIpl("h4_mph4_terrain_occ_02")
RequestIpl("h4_mph4_terrain_occ_03")
RequestIpl("h4_mph4_terrain_occ_04")
RequestIpl("h4_mph4_terrain_occ_05")
RequestIpl("h4_mph4_terrain_occ_06")
RequestIpl("h4_mph4_terrain_occ_07")
RequestIpl("h4_mph4_terrain_occ_08")
RequestIpl("h4_mph4_terrain_occ_09")
RequestIpl("h4_boatblockers")
RequestIpl("h4_islandx")
RequestIpl("h4_islandx_disc_strandedshark")
RequestIpl("h4_islandx_disc_strandedshark_lod")
RequestIpl("h4_islandx_disc_strandedwhale")
RequestIpl("h4_islandx_disc_strandedwhale_lod")
RequestIpl("h4_islandx_props")
RequestIpl("h4_islandx_props_lod")
RequestIpl("h4_islandx_sea_mines")
RequestIpl("h4_mph4_island")
RequestIpl("h4_mph4_island_long_0")
RequestIpl("h4_mph4_island_strm_0")
RequestIpl("h4_aa_guns")
RequestIpl("h4_aa_guns_lod")
RequestIpl("h4_beach")
RequestIpl("h4_beach_bar_props")
RequestIpl("h4_beach_lod")
RequestIpl("h4_beach_party")
RequestIpl("h4_beach_party_lod")
RequestIpl("h4_beach_props")
RequestIpl("h4_beach_props_lod")
RequestIpl("h4_beach_props_party")
RequestIpl("h4_beach_props_slod")
RequestIpl("h4_beach_slod")
RequestIpl("h4_islandairstrip")
-- RequestIpl("h4_islandairstrip_doorsclosed")
-- RequestIpl("h4_islandairstrip_doorsclosed_lod")
RequestIpl("h4_islandairstrip_doorsopen")
RequestIpl("h4_islandairstrip_doorsopen_lod")
RequestIpl("h4_islandairstrip_hangar_props")
RequestIpl("h4_islandairstrip_hangar_props_lod")
RequestIpl("h4_islandairstrip_hangar_props_slod")
RequestIpl("h4_islandairstrip_lod")
RequestIpl("h4_islandairstrip_props")
RequestIpl("h4_islandairstrip_propsb")
RequestIpl("h4_islandairstrip_propsb_lod")
RequestIpl("h4_islandairstrip_propsb_slod")
RequestIpl("h4_islandairstrip_props_lod")
RequestIpl("h4_islandairstrip_props_slod")
RequestIpl("h4_islandairstrip_slod")
RequestIpl("h4_islandxcanal_props")
RequestIpl("h4_islandxcanal_props_lod")
RequestIpl("h4_islandxcanal_props_slod")
RequestIpl("h4_islandxdock")
RequestIpl("h4_islandxdock_lod")
RequestIpl("h4_islandxdock_props")
RequestIpl("h4_islandxdock_props_2")
RequestIpl("h4_islandxdock_props_2_lod")
RequestIpl("h4_islandxdock_props_2_slod")
RequestIpl("h4_islandxdock_props_lod")
RequestIpl("h4_islandxdock_props_slod")
RequestIpl("h4_islandxdock_slod")
RequestIpl("h4_islandxdock_water_hatch")
RequestIpl("h4_islandxtower")
RequestIpl("h4_islandxtower_lod")
RequestIpl("h4_islandxtower_slod")
RequestIpl("h4_islandxtower_veg")
RequestIpl("h4_islandxtower_veg_lod")
RequestIpl("h4_islandxtower_veg_slod")
RequestIpl("h4_islandx_barrack_hatch")
RequestIpl("h4_islandx_barrack_props")
RequestIpl("h4_islandx_barrack_props_lod")
RequestIpl("h4_islandx_barrack_props_slod")
RequestIpl("h4_islandx_checkpoint")
RequestIpl("h4_islandx_checkpoint_lod")
RequestIpl("h4_islandx_checkpoint_props")
RequestIpl("h4_islandx_checkpoint_props_lod")
RequestIpl("h4_islandx_checkpoint_props_slod")
RequestIpl("h4_islandx_maindock")
RequestIpl("h4_islandx_maindock_lod")
RequestIpl("h4_islandx_maindock_props")
RequestIpl("h4_islandx_maindock_props_2")
RequestIpl("h4_islandx_maindock_props_2_lod")
RequestIpl("h4_islandx_maindock_props_2_slod")
RequestIpl("h4_islandx_maindock_props_lod")
RequestIpl("h4_islandx_maindock_props_slod")
RequestIpl("h4_islandx_maindock_slod")
RequestIpl("h4_islandx_mansion")
RequestIpl("h4_islandx_mansion_b")
RequestIpl("h4_islandx_mansion_b_lod")
RequestIpl("h4_islandx_mansion_b_side_fence")
RequestIpl("h4_islandx_mansion_b_slod")
RequestIpl("h4_islandx_mansion_entrance_fence")
RequestIpl("h4_islandx_mansion_guardfence")
RequestIpl("h4_islandx_mansion_lights")
RequestIpl("h4_islandx_mansion_lockup_01")
RequestIpl("h4_islandx_mansion_lockup_01_lod")
RequestIpl("h4_islandx_mansion_lockup_02")
RequestIpl("h4_islandx_mansion_lockup_02_lod")
RequestIpl("h4_islandx_mansion_lockup_03")
RequestIpl("h4_islandx_mansion_lockup_03_lod")
RequestIpl("h4_islandx_mansion_lod")
RequestIpl("h4_islandx_mansion_office")
RequestIpl("h4_islandx_mansion_office_lod")
RequestIpl("h4_islandx_mansion_props")
RequestIpl("h4_islandx_mansion_props_lod")
RequestIpl("h4_islandx_mansion_props_slod")
RequestIpl("h4_islandx_mansion_slod")
RequestIpl("h4_islandx_mansion_vault")
RequestIpl("h4_islandx_mansion_vault_lod")
RequestIpl("h4_island_padlock_props")
RequestIpl("h4_mansion_gate_closed")
RequestIpl("h4_mansion_remains_cage")
RequestIpl("h4_mph4_airstrip")
RequestIpl("h4_mph4_airstrip_interior_0_airstrip_hanger")
RequestIpl("h4_mph4_beach")
RequestIpl("h4_mph4_dock")
RequestIpl("h4_mph4_island_lod")
RequestIpl("h4_mph4_island_ne_placement")
RequestIpl("h4_mph4_island_nw_placement")
RequestIpl("h4_mph4_island_se_placement")
RequestIpl("h4_mph4_island_sw_placement")
RequestIpl("h4_mph4_mansion")
RequestIpl("h4_mph4_mansion_b")
RequestIpl("h4_mph4_mansion_b_strm_0")
RequestIpl("h4_mph4_mansion_strm_0")
RequestIpl("h4_mph4_wtowers")
RequestIpl("h4_ne_ipl_00")
RequestIpl("h4_ne_ipl_00_lod")
RequestIpl("h4_ne_ipl_00_slod")
RequestIpl("h4_ne_ipl_01")
RequestIpl("h4_ne_ipl_01_lod")
RequestIpl("h4_ne_ipl_01_slod")
RequestIpl("h4_ne_ipl_02")
RequestIpl("h4_ne_ipl_02_lod")
RequestIpl("h4_ne_ipl_02_slod")
RequestIpl("h4_ne_ipl_03")
RequestIpl("h4_ne_ipl_03_lod")
RequestIpl("h4_ne_ipl_03_slod")
RequestIpl("h4_ne_ipl_04")
RequestIpl("h4_ne_ipl_04_lod")
RequestIpl("h4_ne_ipl_04_slod")
RequestIpl("h4_ne_ipl_05")
RequestIpl("h4_ne_ipl_05_lod")
RequestIpl("h4_ne_ipl_05_slod")
RequestIpl("h4_ne_ipl_06")
RequestIpl("h4_ne_ipl_06_lod")
RequestIpl("h4_ne_ipl_06_slod")
RequestIpl("h4_ne_ipl_07")
RequestIpl("h4_ne_ipl_07_lod")
RequestIpl("h4_ne_ipl_07_slod")
RequestIpl("h4_ne_ipl_08")
RequestIpl("h4_ne_ipl_08_lod")
RequestIpl("h4_ne_ipl_08_slod")
RequestIpl("h4_ne_ipl_09")
RequestIpl("h4_ne_ipl_09_lod")
RequestIpl("h4_ne_ipl_09_slod")
RequestIpl("h4_nw_ipl_00")
RequestIpl("h4_nw_ipl_00_lod")
RequestIpl("h4_nw_ipl_00_slod")
RequestIpl("h4_nw_ipl_01")
RequestIpl("h4_nw_ipl_01_lod")
RequestIpl("h4_nw_ipl_01_slod")
RequestIpl("h4_nw_ipl_02")
RequestIpl("h4_nw_ipl_02_lod")
RequestIpl("h4_nw_ipl_02_slod")
RequestIpl("h4_nw_ipl_03")
RequestIpl("h4_nw_ipl_03_lod")
RequestIpl("h4_nw_ipl_03_slod")
RequestIpl("h4_nw_ipl_04")
RequestIpl("h4_nw_ipl_04_lod")
RequestIpl("h4_nw_ipl_04_slod")
RequestIpl("h4_nw_ipl_05")
RequestIpl("h4_nw_ipl_05_lod")
RequestIpl("h4_nw_ipl_05_slod")
RequestIpl("h4_nw_ipl_06")
RequestIpl("h4_nw_ipl_06_lod")
RequestIpl("h4_nw_ipl_06_slod")
RequestIpl("h4_nw_ipl_07")
RequestIpl("h4_nw_ipl_07_lod")
RequestIpl("h4_nw_ipl_07_slod")
RequestIpl("h4_nw_ipl_08")
RequestIpl("h4_nw_ipl_08_lod")
RequestIpl("h4_nw_ipl_08_slod")
RequestIpl("h4_nw_ipl_09")
RequestIpl("h4_nw_ipl_09_lod")
RequestIpl("h4_nw_ipl_09_slod")
RequestIpl("h4_se_ipl_00")
RequestIpl("h4_se_ipl_00_lod")
RequestIpl("h4_se_ipl_00_slod")
RequestIpl("h4_se_ipl_01")
RequestIpl("h4_se_ipl_01_lod")
RequestIpl("h4_se_ipl_01_slod")
RequestIpl("h4_se_ipl_02")
RequestIpl("h4_se_ipl_02_lod")
RequestIpl("h4_se_ipl_02_slod")
RequestIpl("h4_se_ipl_03")
RequestIpl("h4_se_ipl_03_lod")
RequestIpl("h4_se_ipl_03_slod")
RequestIpl("h4_se_ipl_04")
RequestIpl("h4_se_ipl_04_lod")
RequestIpl("h4_se_ipl_04_slod")
RequestIpl("h4_se_ipl_05")
RequestIpl("h4_se_ipl_05_lod")
RequestIpl("h4_se_ipl_05_slod")
RequestIpl("h4_se_ipl_06")
RequestIpl("h4_se_ipl_06_lod")
RequestIpl("h4_se_ipl_06_slod")
RequestIpl("h4_se_ipl_07")
RequestIpl("h4_se_ipl_07_lod")
RequestIpl("h4_se_ipl_07_slod")
RequestIpl("h4_se_ipl_08")
RequestIpl("h4_se_ipl_08_lod")
RequestIpl("h4_se_ipl_08_slod")
RequestIpl("h4_se_ipl_09")
RequestIpl("h4_se_ipl_09_lod")
RequestIpl("h4_se_ipl_09_slod")
RequestIpl("h4_sw_ipl_00")
RequestIpl("h4_sw_ipl_00_lod")
RequestIpl("h4_sw_ipl_00_slod")
RequestIpl("h4_sw_ipl_01")
RequestIpl("h4_sw_ipl_01_lod")
RequestIpl("h4_sw_ipl_01_slod")
RequestIpl("h4_sw_ipl_02")
RequestIpl("h4_sw_ipl_02_lod")
RequestIpl("h4_sw_ipl_02_slod")
RequestIpl("h4_sw_ipl_03")
RequestIpl("h4_sw_ipl_03_lod")
RequestIpl("h4_sw_ipl_03_slod")
RequestIpl("h4_sw_ipl_04")
RequestIpl("h4_sw_ipl_04_lod")
RequestIpl("h4_sw_ipl_04_slod")
RequestIpl("h4_sw_ipl_05")
RequestIpl("h4_sw_ipl_05_lod")
RequestIpl("h4_sw_ipl_05_slod")
RequestIpl("h4_sw_ipl_06")
RequestIpl("h4_sw_ipl_06_lod")
RequestIpl("h4_sw_ipl_06_slod")
RequestIpl("h4_sw_ipl_07")
RequestIpl("h4_sw_ipl_07_lod")
RequestIpl("h4_sw_ipl_07_slod")
RequestIpl("h4_sw_ipl_08")
RequestIpl("h4_sw_ipl_08_lod")
RequestIpl("h4_sw_ipl_08_slod")
RequestIpl("h4_sw_ipl_09")
RequestIpl("h4_sw_ipl_09_lod")
RequestIpl("h4_sw_ipl_09_slod")
RequestIpl("h4_underwater_gate_closed")
RequestIpl("h4_islandx_placement_01")
RequestIpl("h4_islandx_placement_02")
RequestIpl("h4_islandx_placement_03")
RequestIpl("h4_islandx_placement_04")
RequestIpl("h4_islandx_placement_05")
RequestIpl("h4_islandx_placement_06")
RequestIpl("h4_islandx_placement_07")
RequestIpl("h4_islandx_placement_08")
RequestIpl("h4_islandx_placement_09")
RequestIpl("h4_islandx_placement_10")
RequestIpl("h4_mph4_island_placement")
RequestIpl("redCarpet")
RequestIpl("refit_unload")
RequestIpl("CS1_02_cf_onmission1")
RequestIpl("SP1_10_real_interior")
RequestIpl("v_tunnel_hole")
RequestIpl("golfflags")
RequestIpl("TrevorsTrailerTidy")
RemoveIpl("TrevorsMP")

--------------------------------------------------------------

RegisterCommand("combat", function(source, args, rawCommand)
  Citizen.Wait(0)
  local ped = GetPlayerPed(-1)
  if not GetPedConfigFlag(ped,78,1) then
    SetPedUsingActionMode(GetPlayerPed(-1), true, -1, 0)
  end
end)

RegisterCommand("normal", function(source, args, rawCommand)
  Citizen.Wait(0)
  local ped = GetPlayerPed(-1)
  if not GetPedConfigFlag(ped,78,1) then
    SetPedUsingActionMode(GetPlayerPed(-1), false, -1, 0)
  end
end)





--------------------------------------------------------------

RegisterNetEvent("farmburned:updateIPL")
AddEventHandler("farmburned:updateIPL", function()
    RemoveIpl("farm")
    RemoveIpl("farm_int")
    RequestIpl("farm_burnt")
    RequestIpl("des_farmhouse")
    RequestIpl("farmint")
    RequestIpl("farm_burnt_props")
    RequestIpl("des_farmhs_endimap")
    RequestIpl("des_farmhs_end_occl")
end)

RegisterCommand("farmburned", function()
    TriggerServerEvent("farmburned:updateIPL")
end, false)




RegisterNetEvent("farmrepair:updateIPL")
AddEventHandler("farmrepair:updateIPL", function()
    RemoveIpl("farm_burnt")
    RemoveIpl("farm_int")
    RemoveIpl("farm_burnt_props")
    RemoveIpl("des_farmhs_endimap")
    RemoveIpl("des_farmhs_end_occl")

    RequestIpl("farm")
    RequestIpl("farmint")
    RequestIpl("farm_lod")
    RequestIpl("farm_props")

end)

RegisterCommand("repairfarm", function()
    TriggerServerEvent("farmrepair:updateIPL")
end, false)
--------------------------------------------------------------

RegisterNetEvent("traincrash:updateIPL")
AddEventHandler("traincrash:updateIPL", function()
    RemoveIpl("canyonriver01")
    RemoveIpl("railing_start")

    RequestIpl("canyonriver01_traincrash")
    RequestIpl("railing_end")
end)

RegisterCommand("traincrash", function()
    TriggerServerEvent("traincrash:updateIPL")
end, false)


RegisterNetEvent("trainrepaired:updateIPL")
AddEventHandler("trainrepaired:updateIPL", function()
    RemoveIpl("canyonriver01_traincrash")
    RemoveIpl("railing_end")

    RequestIpl("canyonriver01")
    RequestIpl("railing_start")
end)

RegisterCommand("trainrepaired", function()
    TriggerServerEvent("trainrepaired:updateIPL")
end, false)

--------------------------------------------------------------

RegisterNetEvent("cargoship:updateIPL")
AddEventHandler("cargoship:updateIPL", function()
    RemoveIpl("sunkcargoship")
    RemoveIpl("SUNK_SHIP_FIRE")

    RequestIpl("cargoship")
end)

RegisterCommand("cargoship", function()
    TriggerServerEvent("cargoship:updateIPL")
end, false)


RegisterNetEvent("cargoshipfire:updateIPL")
AddEventHandler("cargoshipfire:updateIPL", function()
    RemoveIpl("cargoship")
    RequestIpl("sunkcargoship")
    RequestIpl("SUNK_SHIP_FIRE")
end)

RegisterCommand("cargoshipfire", function()
    TriggerServerEvent("cargoshipfire:updateIPL")
end, false)


RegisterNetEvent("cargoshipsunk:updateIPL")
AddEventHandler("cargoshipsunk:updateIPL", function()
    RemoveIpl("cargoship")
    RemoveIpl("SUNK_SHIP_FIRE")
    RequestIpl("sunkcargoship")
end)

RegisterCommand("cargoshipsunk", function()
    TriggerServerEvent("cargoshipsunk:updateIPL")
end, false)

RegisterNetEvent("cargoshipgone:updateIPL")
AddEventHandler("cargoshipgone:updateIPL", function()
    RemoveIpl("sunkcargoship")
    RemoveIpl("SUNK_SHIP_FIRE")
    RemoveIpl("cargoship")
end)

RegisterCommand("cargoshipgone", function()
    TriggerServerEvent("cargoshipgone:updateIPL")
end, false)


--------------------------------------------------------------


RegisterNetEvent("stilhousedestroyed:updateIPL")
AddEventHandler("stilhousedestroyed:updateIPL", function()
    RemoveIpl("DES_stilthouse_rebuild")
    RequestIpl("DES_StiltHouse_imapend")
end)

RegisterCommand("stilhousedestroyed", function()
    TriggerServerEvent("stilhousedestroyed:updateIPL")
end, false)


RegisterNetEvent("stilhouserebuild:updateIPL")
AddEventHandler("stilhouserebuild:updateIPL", function()
    RequestIpl("DES_stilthouse_rebuild")
    RemoveIpl("DES_StiltHouse_imapend")
end)

RegisterCommand("stilhouserebuild", function()
    TriggerServerEvent("stilhouserebuild:updateIPL")
end, false)

RegisterNetEvent("stilhousedefault:updateIPL")
AddEventHandler("stilhousedefault:updateIPL", function()
    RemoveIpl("DES_stilthouse_rebuild")
    RemoveIpl("DES_StiltHouse_imapend")
    RequestIpl("StiltHouse")
end)

RegisterCommand("stilhousedefault", function()
    TriggerServerEvent("stilhousedefault:updateIPL")
end, false)








--------------------------------------------------------------







RefreshInterior(269313)
ActivateInteriorEntitySet(269313, "set_int_02_trophy_iaa")
ActivateInteriorEntitySet(269313, "set_int_02_trophy1")
SetInteriorEntitySetColor(269313, "set_int_02_trophy1", 1)
ActivateInteriorEntitySet(269313, "set_int_02_trophy_sub")
SetInteriorEntitySetColor(269313, "set_int_02_trophy_sub", 1)

ActivateInteriorEntitySet(269313, "set_int_02_flightrecord_complete")
ActivateInteriorEntitySet(269313, "set_int_02_burglary_complete")
ActivateInteriorEntitySet(269313, "set_int_02_daylightrob_complete")
ActivateInteriorEntitySet(269313, "set_int_02_aqualungs_complete")
ActivateInteriorEntitySet(269313, "set_int_02_forcedentry_complete")
ActivateInteriorEntitySet(269313, "set_int_02_paramedic_complete")

ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_paramedic")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_morgue")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_serverfarm")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_iaa")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_steal_avenger")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_foundry")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_riot_van")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_stromberg")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_sub_finale")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_predator")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_khanjali")
ActivateInteriorEntitySet(269313, "Set_Int_02_outfit_volatol")

ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Panther1")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Panther2")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Panther3")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Riot1")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Riot2")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Riot3")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Cheno1")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Cheno2")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Cheno3")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Thruster1")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Thruster2")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Thruster3")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Avenger1")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Avenger2")
ActivateInteriorEntitySet(269313, "Set_Int_02_Parts_Avenger3")
ActivateInteriorEntitySet(269313, "set_int_02_clutter1")
ActivateInteriorEntitySet(269313, "set_int_02_clutter2")
ActivateInteriorEntitySet(269313, "set_int_02_clutter3")
ActivateInteriorEntitySet(269313, "set_int_02_clutter4")
ActivateInteriorEntitySet(269313, "set_int_02_clutter5")
ActivateInteriorEntitySet(269313, "set_int_02_shell")
ActivateInteriorEntitySet(269313, "set_int_02_cannon")
ActivateInteriorEntitySet(269313, "set_int_02_security")
DeactivateInteriorEntitySet(269313, "set_int_02_decal_01")
RefreshInterior(269313)
RefreshInterior(258561)
DeactivateInteriorEntitySet(258561, "bunker_style_c")
DeactivateInteriorEntitySet(258561, "bunker_style_a")
ActivateInteriorEntitySet(258561, "bunker_style_b")
ActivateInteriorEntitySet(258561, "upgrade_bunker_set")
ActivateInteriorEntitySet(258561, "Upgrade_Bunker_Set_More")
ActivateInteriorEntitySet(258561, "security_upgrade")
ActivateInteriorEntitySet(258561, "office_upgrade_set")
ActivateInteriorEntitySet(258561, "gun_locker_upgrade")
ActivateInteriorEntitySet(258561, "gun_range_lights")
ActivateInteriorEntitySet(258561, "Gun_schematic_set")
RefreshInterior(258561)
RefreshInterior(272129)

-- ActivateInteriorEntitySet(272129, "Int_03_ba_Design_01")
ActivateInteriorEntitySet(272129, "Int_03_ba_Light_Rig5")
SetInteriorEntitySetColor(272129, "Int_03_ba_Light_Rig5", 1)
ActivateInteriorEntitySet(272129, "Int_03_ba_Tint")
SetInteriorEntitySetColor(272129, "Int_03_ba_Tint", 1)
ActivateInteriorEntitySet(272129, "Int_03_ba_weapons_mod")
SetInteriorEntitySetColor(272129, "Int_03_ba_weapons_mod", 1)
ActivateInteriorEntitySet(272129, "Int_03_ba_drone")
SetInteriorEntitySetColor(272129, "Int_03_ba_drone", 1)
ActivateInteriorEntitySet(272129, "Int_03_ba_bikemod")
SetInteriorEntitySetColor(272129, "Int_03_ba_bikemod", 1)
RefreshInterior(272129)

RefreshInterior(271873)
ActivateInteriorEntitySet(271873, "Int02_ba_floor01")
DeactivateInteriorEntitySet(271873, "Int02_ba_floor02")
DeactivateInteriorEntitySet(271873, "Int02_ba_floor03")
DeactivateInteriorEntitySet(271873, "Int02_ba_floor04")
DeactivateInteriorEntitySet(271873, "Int02_ba_floor05")
DeactivateInteriorEntitySet(271873, "Int02_ba_sec_upgrade_grg")
ActivateInteriorEntitySet(271873, "Int02_ba_sec_upgrade_strg")
ActivateInteriorEntitySet(271873, "Int02_ba_sec_upgrade_desk?")
ActivateInteriorEntitySet(271873, "Int02_ba_equipment_upgrade")
ActivateInteriorEntitySet(271873, "Int02_ba_truckmod")
ActivateInteriorEntitySet(271873, "Int02_ba_DeskPC")
ActivateInteriorEntitySet(271873, "Int02_ba_clutterstuff")
ActivateInteriorEntitySet(271873, "Int02_ba_sec_desks_L1")
ActivateInteriorEntitySet(271873, "Int02_ba_sec_desks_L2345")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash_EQP")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged_EQP")
ActivateInteriorEntitySet(271873, "Int02_ba_coke_EQP")
ActivateInteriorEntitySet(271873, "Int02_ba_meth_EQP")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed_EQP")

ActivateInteriorEntitySet(271873, "Int02_ba_Forged01")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged02")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged03")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged04")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged05")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged06")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged07")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged08")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged09")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged10")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged11")
ActivateInteriorEntitySet(271873, "Int02_ba_Forged12")

ActivateInteriorEntitySet(271873, "Int02_ba_Cash01")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash02")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash03")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash04")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash05")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash06")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash07")
ActivateInteriorEntitySet(271873, "Int02_ba_Cash08")

ActivateInteriorEntitySet(271873, "Int02_ba_coke01")
ActivateInteriorEntitySet(271873, "Int02_ba_coke02")

ActivateInteriorEntitySet(271873, "Int02_ba_meth01")
ActivateInteriorEntitySet(271873, "Int02_ba_meth02")
ActivateInteriorEntitySet(271873, "Int02_ba_meth03")
ActivateInteriorEntitySet(271873, "Int02_ba_meth04")

ActivateInteriorEntitySet(271873, "Int02_ba_Weed01")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed02")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed03")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed04")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed05")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed06")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed07")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed08")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed09")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed10")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed11")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed12")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed13")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed14")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed15")
ActivateInteriorEntitySet(271873, "Int02_ba_Weed16")
RefreshInterior(271873)
RefreshInterior(271617)
ActivateInteriorEntitySet(271617, "Int01_ba_security_upgrade")
ActivateInteriorEntitySet(271617, "Int01_ba_equipment_setup")
DeactivateInteriorEntitySet(271617, "Int01_ba_Style01")
ActivateInteriorEntitySet(271617, "Int01_ba_Style02")
DeactivateInteriorEntitySet(271617, "Int01_ba_Style03")
ActivateInteriorEntitySet(271617, "Int01_ba_style02_podium")
ActivateInteriorEntitySet(271617, "int01_ba_lights_screen")
ActivateInteriorEntitySet(271617, "Int01_ba_Screen")
ActivateInteriorEntitySet(271617, "Int01_ba_bar_content")
ActivateInteriorEntitySet(271617, "Int01_ba_booze_01")
ActivateInteriorEntitySet(271617, "Int01_ba_booze_02")
ActivateInteriorEntitySet(271617, "Int01_ba_booze_03")
ActivateInteriorEntitySet(271617, "Int01_ba_dj04")
DeactivateInteriorEntitySet(271617, "Int01_ba_dj01")
DeactivateInteriorEntitySet(271617, "Int01_ba_dj03")
DeactivateInteriorEntitySet(271617, "Int01_ba_dj02")

ActivateInteriorEntitySet(271617, "Int01_ba_trad_lights")
ActivateInteriorEntitySet(271617, "Int01_ba_deliverytruck")
ActivateInteriorEntitySet(271617, "Int01_ba_dry_ice")
ActivateInteriorEntitySet(271617, "Int01_ba_lightgrid_01")
ActivateInteriorEntitySet(271617, "Int01_ba_equipment_upgrade")

ActivateInteriorEntitySet(271617, "Int01_ba_Worklamps")
ActivateInteriorEntitySet(271617, "Int01_ba_Clutter")

DeactivateInteriorEntitySet(271617, "Int01_ba_clubname_01")
ActivateInteriorEntitySet(271617, "Int01_ba_clubname_03")

ActivateInteriorEntitySet(271617, "DJ_01_Lights_04")
ActivateInteriorEntitySet(271617, "DJ_02_Lights_04")
ActivateInteriorEntitySet(271617, "DJ_03_Lights_04")
ActivateInteriorEntitySet(271617, "DJ_04_Lights_04")

ActivateInteriorEntitySet(271617, "DJ_01_Lights_01")
ActivateInteriorEntitySet(271617, "DJ_02_Lights_01")
ActivateInteriorEntitySet(271617, "DJ_03_Lights_01")
ActivateInteriorEntitySet(271617, "DJ_04_Lights_01")

ActivateInteriorEntitySet(271617, "DJ_01_Lights_02")
ActivateInteriorEntitySet(271617, "DJ_02_Lights_02")
ActivateInteriorEntitySet(271617, "DJ_03_Lights_02")
ActivateInteriorEntitySet(271617, "DJ_04_Lights_02")

DeactivateInteriorEntitySet(271617, "DJ_01_Lights_03")
DeactivateInteriorEntitySet(271617, "DJ_02_Lights_03")
DeactivateInteriorEntitySet(271617, "DJ_03_Lights_03")
DeactivateInteriorEntitySet(271617, "DJ_04_Lights_03")

ActivateInteriorEntitySet(271617, "Int01_ba_trophy01")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy02")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy03")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy04")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy05")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy06")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy07")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy08")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy09")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy10")
ActivateInteriorEntitySet(271617, "Int01_ba_trophy11")
RefreshInterior(271617)

ActivateInteriorEntitySet(290305, "set_equipment_upgrade")
ActivateInteriorEntitySet(290305, "set_product_05")
ActivateInteriorEntitySet(290305, "set_product_04")
ActivateInteriorEntitySet(290305, "set_product_03")
ActivateInteriorEntitySet(290305, "set_product_02")
ActivateInteriorEntitySet(290305, "set_product_01")
ActivateInteriorEntitySet(290305, "set_supplies_05")
ActivateInteriorEntitySet(290305, "set_supplies_04")
ActivateInteriorEntitySet(290305, "set_supplies_03")
ActivateInteriorEntitySet(290305, "set_supplies_02")
ActivateInteriorEntitySet(290305, "set_supplies_01")
RefreshInterior(290305)

ActivateInteriorEntitySet(290561, "entity_set_tint_01")
ActivateInteriorEntitySet(290561, "entity_set_numbers_01")
ActivateInteriorEntitySet(290561, "entity_set_shell_01")
RefreshInterior(290561)


ActivateInteriorEntitySet(293121, "1850401837")
ActivateInteriorEntitySet(293121, "3518317325")
ActivateInteriorEntitySet(293121, "957515592")
RefreshInterior(293121)


ActivateInteriorEntitySet(290817, "entity_set_mission_2")
ActivateInteriorEntitySet(290817, "entity_set_mission_3")
ActivateInteriorEntitySet(290817, "entity_set_mission_6")
ActivateInteriorEntitySet(290817, "entity_set_mission_8")
ActivateInteriorEntitySet(290817, "entity_set_mission_9")
ActivateInteriorEntitySet(290817, "entity_set_mission_11")
ActivateInteriorEntitySet(290817, "entity_set_freemode_1")
ActivateInteriorEntitySet(290817, "entity_set_freemode_2")
ActivateInteriorEntitySet(290817, "entity_set_freemode_3")
ActivateInteriorEntitySet(290817, "entity_set_freemode_4")
ActivateInteriorEntitySet(290817, "entity_set_freemode_5")
ActivateInteriorEntitySet(290817, "entity_set_freemode_6")
ActivateInteriorEntitySet(290817, "entity_set_freemode_7")
ActivateInteriorEntitySet(290817, "entity_set_freemode_8")
ActivateInteriorEntitySet(290817, "entity_set_freemode_9")
ActivateInteriorEntitySet(290817, "entity_set_freemode_10")
ActivateInteriorEntitySet(290817, "entity_set_freemode_11")
ActivateInteriorEntitySet(290817, "entity_set_roller_door_closed")
RefreshInterior(290817)

DeactivateInteriorEntitySet(278017, "Set_Casino_Bar_Chairs")
RefreshInterior(278017)

ActivateInteriorEntitySet(270081, "iaa_benches")
ActivateInteriorEntitySet(270081, "IAA_Conf2_Chairs")
ActivateInteriorEntitySet(270081, "IAA_CoverPoints_01")
RefreshInterior(270081)


ActivateInteriorEntitySet(289537, "entity_set_light_option_1")
ActivateInteriorEntitySet(289537, "entity_set_office")
ActivateInteriorEntitySet(289537, "entity_set_tint_options")
DeactivateInteriorEntitySet(289537, "entity_set_light_option_2")
DeactivateInteriorEntitySet(289537, "entity_set_light_option_3")
RefreshInterior(289537)

DeactivateInteriorEntitySet(286977, "Entity_Set_Fire")
ActivateInteriorEntitySet(286977, "entity_set_default")
DeactivateInteriorEntitySet(286977, "Entity_Set_FIX_STU_EXT_P1")
ActivateInteriorEntitySet(286977, "Entity_Set_FIX_STU_EXT_P3A1 ")
DeactivateInteriorEntitySet(286977, "Entity_Set_FIX_TRIP1_INT_P2")
RefreshInterior(286977)

ActivateInteriorEntitySet(281345, "entity_set_hatch_lights_on")
ActivateInteriorEntitySet(281345, "entity_set_acetylene")
ActivateInteriorEntitySet(281345, "entity_set_brig")
ActivateInteriorEntitySet(281345, "entity_set_fingerprint")
ActivateInteriorEntitySet(281345, "entity_set_guide")
ActivateInteriorEntitySet(281345, "entity_set_jammer")
ActivateInteriorEntitySet(281345, "entity_set_plasma")
ActivateInteriorEntitySet(281345, "entity_set_suppressors")
ActivateInteriorEntitySet(281345, "entity_set_weapons")
RefreshInterior(281345)



SetScenarioTypeEnabled("WORLD_MOUNTAIN_LION_REST", true)
SetScenarioTypeEnabled("WORLD_MOUNTAIN_LION_WANDER", true)
SetScenarioTypeEnabled("DRIVE", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_BIKE", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_CAR", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_NEXT_TO_CAR", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_SOLO", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_BIKER", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_DRIVE_PASSENGERS", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON_DIRT_BIKE", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_BICYCLE_MOUNTAIN", true)
SetScenarioTypeEnabled("PROP_HUMAN_SEAT_CHAIR", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_ATTRACTOR", true)
SetScenarioTypeEnabled("WORLD_HUMAN_LEANING", true)
SetScenarioTypeEnabled("WORLD_HUMAN_HANG_OUT_STREET", true)
SetScenarioTypeEnabled("WORLD_HUMAN_DRINKING", true)
SetScenarioTypeEnabled("WORLD_HUMAN_SMOKING", true)
SetScenarioTypeEnabled("WORLD_HUMAN_GUARD_STAND", true)
SetScenarioTypeEnabled("WORLD_HUMAN_CLIPBOARD", true)
SetScenarioTypeEnabled("WORLD_HUMAN_HIKER", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_EMPTY", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", true)
SetScenarioTypeEnabled("WORLD_HUMAN_PAPARAZZI", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_PARK_PARALLEL", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_CONSTRUCTION_SOLO", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_CONSTRUCTION_PASSENGERS", true)
SetScenarioTypeEnabled("WORLD_VEHICLE_TRUCK_LOGS", true)
SetScenarioTypeEnabled("WALK", true)

SetScenarioGroupEnabled("ALAMO_PLANES", true)
SetScenarioGroupEnabled("ARMENIAN_CATS", true)
SetScenarioGroupEnabled("ARMY_GUARD", true)
SetScenarioGroupEnabled("ARMY_HELI", true)
SetScenarioGroupEnabled("ATTRACT_PAP", true)
SetScenarioGroupEnabled("BLIMP", true)
SetScenarioGroupEnabled("CHINESE2_HILLBILLIES", true)
SetScenarioGroupEnabled("Chinese2_Lunch", true)
SetScenarioGroupEnabled("Cinema_Downtown", true)
SetScenarioGroupEnabled("Cinema_Morningwood", true)
SetScenarioGroupEnabled("Cinema_Textile", true)
SetScenarioGroupEnabled("City_Banks", true)
SetScenarioGroupEnabled("Countryside_Banks", true)
SetScenarioGroupEnabled("DEALERSHIP", true)
SetScenarioGroupEnabled("FIB_GROUP_1", true)
SetScenarioGroupEnabled("FIB_GROUP_2", true)
SetScenarioGroupEnabled("GRAPESEED_PLANES", true)
SetScenarioGroupEnabled("Grapeseed_Planes", true)
SetScenarioGroupEnabled("KORTZ_SECURITY", true)
SetScenarioGroupEnabled("LOST_BIKERS", true)
SetScenarioGroupEnabled("LSA_Planes", true)
SetScenarioGroupEnabled("MOVIE_STUDIO_SECURITY", true)
SetScenarioGroupEnabled("MP_POLICE", true)
SetScenarioGroupEnabled("Observatory_Bikers", true)
SetScenarioGroupEnabled("POLICE_POUND1", true)
SetScenarioGroupEnabled("POLICE_POUND2", true)
SetScenarioGroupEnabled("POLICE_POUND3", true)
SetScenarioGroupEnabled("POLICE_POUND4", true)
SetScenarioGroupEnabled("POLICE_POUND5", true)
SetScenarioGroupEnabled("PRISON_TOWERS", true)
SetScenarioGroupEnabled("QUARRY", true)
SetScenarioGroupEnabled("Rampage1", true)
SetScenarioGroupEnabled("SANDY_PLANES", true)
SetScenarioGroupEnabled("SCRAP_SECURITY", true)
SetScenarioGroupEnabled("SEW_MACHINE", true)
SetScenarioGroupEnabled("SOLOMON_GATE", true)
SetScenarioGroupEnabled("Triathlon_1", false)
SetScenarioGroupEnabled("Triathlon_2", false)
SetScenarioGroupEnabled("Triathlon_3", false)

SwitchTrainTrack(0, true) -- Setting the Main train track(s) around LS and towards Sandy Shores active
SwitchTrainTrack(3, true) -- Setting the Metro tracks active
SetTrainTrackSpawnFrequency(0, 0)
SetTrainTrackSpawnFrequency(3, 0)
SetRandomTrains(true) -- Telling the game we want to use randomly spawned trains

SetPlaneTurbulenceMultiplier(aa10, 0.0)
SetPlaneTurbulenceMultiplier(mq1p, 0.0)
SetPlaneTurbulenceMultiplier(mq9r, 0.0)
SetPlaneTurbulenceMultiplier(avashut, 0.0)
SetPlaneTurbulenceMultiplier(quinjet, 0.0)

----------------------------------------



-- Citizen.CreateThread(function()
--    while true 
--        do
        
--    SetWeatherTypePersist("XMAS")
--        SetWeatherTypeNowPersist("XMAS")
--        SetWeatherTypeNow("XMAS")
--        SetOverrideWeather("XMAS")
--        SetForcePedFootstepsTracks(true)
--	SetForceVehicleTrails(true)
--        Citizen.Wait(1)
--    end



----------------------------------------


-- end)


    local pedModels = {
        "s_m_y_pilot_01", "s_m_y_cop_01", "s_m_y_cop_02", "s_m_y_swat_01", "s_m_y_hwaycop_01", "csb_cop", "s_f_y_cop_01", "s_m_m_snowcop_01", "s_m_y_hwaycop_01"
   }

   for _, modelName in ipairs(pedModels) do
        SetPedModelIsSuppressed(GetHashKey(modelName), true)
   end

