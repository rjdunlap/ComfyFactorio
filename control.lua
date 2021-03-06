require 'utils.data_stages'
_LIFECYCLE = _STAGE.control -- Control stage
_DEBUG = false
_DUMP_ENV = false

server_commands = require 'utils.server'
require "utils.server_commands"
require "utils.utils"
require "utils.corpse_util"  --disable for hunger games
require "chatbot"
require "commands"
require "session_tracker"
require "antigrief"
require "antigrief_admin_panel"
require "group"
require "player_list"
require "poll"
require "score"

---- enable modules here ----
--require "tools.cheat_mode"
--require "modules.hunger"
--require "modules.area_unlocked_on_rotated_entity"
--require "modules.fish_respawner"
--require "modules.rocket_launch_always_yields_science"
--require "modules.launch_fish_to_win"
--require "modules.satellite_score"
--require "modules.restrictive_fluid_mining"
--require "modules.fluids_are_explosive"
--require "modules.explosives_are_explosive"
--require "modules.explosive_biters"
--require "modules.railgun_enhancer"
--require "modules.dynamic_landfill"
--require "modules.players_trample_paths"
--require "modules.hunger_games"
--require "modules.explosive_player_respawn"
--require "modules.burden"
--require "modules.team_teleport"
--require "modules.surface_holes_and_elevators"
--require "modules.dangerous_goods"
--require "modules.biters_avoid_damage"
require "modules.comfylatron"
-----------------------------

---- enable maps here ----
--require "maps.biter_battles_v2.biter_battles_v2"
--require "maps.biter_battles.biter_battles"
--require "maps.cave_miner"
--require "maps.labyrinth"
--require "maps.junkyard"
--require "maps.spooky_forest"
--require "maps.nightfall"
--require "maps.lost"
--require "maps.hedge_maze"
--require "maps.rivers"
--require "maps.atoll"
--require "maps.choppy"
--require "maps.tank_battles"
--require "maps.spiral_troopers"
require "maps.fish_defender.fish_defender"
--require "maps.mountain_fortress"
--require "maps.stoneblock"
--require "maps.deep_jungle"
--require "maps.crossing"
--require "maps.anarchy"
--require "maps.spaghettorio"
--require "maps.lost_desert"
--require "maps.empty_map"
--require "maps.custom_start"
-----------------------------

local event = require 'utils.event'

if _DUMP_ENV then
    require 'utils.dump_env'
end
if _DEBUG then
    require 'utils.debug.command'
end

local function on_player_created(event)	
	local player = game.players[event.player_index]	
	player.gui.top.style = 'slot_table_spacing_horizontal_flow'
	player.gui.left.style = 'slot_table_spacing_vertical_flow'
end

local function on_init()
	game.forces.player.research_queue_enabled = true
end

event.on_init(on_init)
event.add(defines.events.on_player_created, on_player_created)