from .lua_bridge import LuaBridge

lua_bridge = LuaBridge()
item = lua_bridge.get_item()
agent_array = lua_bridge.get_agent_array()
agent = lua_bridge.get_agent()
effects = lua_bridge.get_effects()
inventory = lua_bridge.get_inventory()
item_array = lua_bridge.get_item_array()
map = lua_bridge.get_map()
merchant = lua_bridge.get_merchant()
party = lua_bridge.get_party()
quest = lua_bridge.get_quest()
skill = lua_bridge.get_skill()
skillbar = lua_bridge.get_skillbar()

map_id_tester = lua_bridge.get_map_id_tester()
while True:
    map_id_tester.render()