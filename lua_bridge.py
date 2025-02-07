from lupa import LuaRuntime

class LuaBridge:
    def __init__(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self._setup_lua_environment()
        self._load_scripts()

    def _setup_lua_environment(self):
        self.lua.globals()['PyItem'] = PyItem
        self.lua.globals()['PyInventory'] = PyInventory
        self.lua.globals()['PyAgent'] = PyAgent
        self.lua.globals()['PyPlayer'] = PyPlayer
        self.lua.globals()['PyEffects'] = PyEffects
        self.lua.globals()['PyItemArray'] = PyItemArray
        self.lua.globals()['PyMap'] = PyMap
        self.lua.globals()['PyMerchant'] = PyMerchant
        self.lua.globals()['PyParty'] = PyParty
        self.lua.globals()['PyQuest'] = PyQuest
        self.lua.globals()['PySkill'] = PySkill
        self.lua.globals()['PySkillbar'] = PySkillbar

        self.lua.globals()['PyImGui'] = PyImGui
        self.lua.globals()['map'] = self.get_map()  # Make map available to Lua


    def _load_scripts(self):
    script_dir = pathlib.Path(__file__).parent / 'lua_scripts'
    
    # Load Lua scripts
    with open(script_dir / 'Item.lua', 'r') as f:
        self.item = self.lua.execute(f.read())
        
    with open(script_dir / 'AgentArray.lua', 'r') as f:
        self.agent_array = self.lua.execute(f.read())
        
    with open(script_dir / 'Agent.lua', 'r') as f:
        self.agent = self.lua.execute(f.read())
        
    with open(script_dir / 'Effects.lua', 'r') as f:
        self.effects = self.lua.execute(f.read())
        
    with open(script_dir / 'Inventory.lua', 'r') as f:
        self.inventory = self.lua.execute(f.read())
        
    with open(script_dir / 'ItemArray.lua', 'r') as f:
        self.item_array = self.lua.execute(f.read())
        
    with open(script_dir / 'Map.lua', 'r') as f:
        self.map = self.lua.execute(f.read())
        
    with open(script_dir / 'Merchant.lua', 'r') as f:
        self.merchant = self.lua.execute(f.read())
        
    with open(script_dir / 'Party.lua', 'r') as f:
        self.party = self.lua.execute(f.read())
        
    with open(script_dir / 'Quest.lua', 'r') as f:
        self.quest = self.lua.execute(f.read())
        
    with open(script_dir / 'Skill.lua', 'r') as f:
        self.skill = self.lua.execute(f.read())
        
    with open(script_dir / 'Skillbar.lua', 'r') as f:
        self.skillbar = self.lua.execute(f.read())
    
    with open(script_dir / 'imgui.lua', 'r') as f:
        self.imgui = self.lua.execute(f.read())
    
    #MapTester
    with open(script_dir / 'map_id_tester.lua', 'r') as f:
        self.map_id_tester = self.lua.execute(f.read())



def get_item(self):
    return self.item

def get_agent_array(self):
    return self.agent_array

def get_agent(self):
    return self.agent

def get_effects(self):
    return self.effects

def get_inventory(self):
    return self.inventory

def get_item_array(self):
    return self.item_array

def get_map(self):
    return self.map

def get_merchant(self):
    return self.merchant

def get_party(self):
    return self.party

def get_quest(self):
    return self.quest

def get_skill(self):
    return self.skill

def get_skillbar(self):
    return self.skillbar

def get_map_id_tester(self):
    return self.map_id_tester.new()