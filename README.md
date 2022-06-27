# dox-hunting
nopixel with qb-target

made by : https://github.com/Doxthehuman/QBUS-Nopixel-Hunting
fix by : arabcodingteam

```
video
```
https://youtu.be/WiommypiiaA
```
to qb-core
```
```
["huntingcarcass1"] 			 = {["name"] = "huntingcarcass1",				["label"] = "Carcass Level 1",			["weight"] = 100000,    ["type"] = "item",		["image"] = "huntingcarcass1.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Dam this shit looks hot! Level 1"},
	["huntingcarcass2"] 			 = {["name"] = "huntingcarcass2",				["label"] = "Carcass Level 2",			["weight"] = 100000,    ["type"] = "item",		["image"] = "huntingcarcass2.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Dam this shit looks hot! Level 2"},
	["huntingcarcass3"] 			 = {["name"] = "huntingcarcass3",				["label"] = "Carcass Level 3",			["weight"] = 100000,    ["type"] = "item",		["image"] = "huntingcarcass3.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Dam this shit looks hot! Level 3"},
	["huntingcarcass4"] 			 = {["name"] = "huntingcarcass4",				["label"] = "Carcass Red",			    ["weight"] = 100000,    ["type"] = "item",		["image"] = "huntingcarcass4.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Dam this shit looks hot! What do I do with this now?"},
	["huntingbait"] 			     = {["name"] = "huntingbait",				    ["label"] = "Animal Bait",			    ["weight"] = 1000,    	["type"] = "item",		["image"] = "huntingbait.png",          ["unique"] = false,		["useable"] = true,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Smells like old fish and shoes"},
  ```
  
  ```
  items :
  
  ```
  ![huntingbait](https://user-images.githubusercontent.com/89742984/156741107-06be4f5b-0ab6-4a2d-8e1d-68dda5f44b62.png)
![huntingcarcass1](https://user-images.githubusercontent.com/89742984/156741149-faad4b5a-5929-41cf-9979-8db93bb0e4ec.png)
![huntingcarcass2](https://user-images.githubusercontent.com/89742984/156741188-e8c1f746-172c-4e9f-b994-c61503e1bd9e.png)
![huntingcarcass3](https://user-images.githubusercontent.com/89742984/156741204-dabd524c-bd36-454c-9292-1de4443de5ff.png)
![huntingcarcass4](https://user-images.githubusercontent.com/89742984/156741210-e89dbc57-0afe-4181-ab55-eb4a707f5b23.png)
![snp_ammo](https://user-images.githubusercontent.com/89742984/156741263-9d214d89-15fe-4518-a3b2-9433a5c0de41.png)
![weapon_sniperrifle](https://user-images.githubusercontent.com/89742984/156741329-b9bfe032-882e-4517-93da-526916f1a54b.png)

```
sniper add-on :

```
https://gta5mod.net/gta-5-mods/weapons/sniper-rifles/winchester-model-70-hunting-rifle/#google_vignette
```
qb-target :
```
https://github.com/BerkieBb/qb-target

```
in Config.Peds

[1] = { 
  model = 'ig_hunter',
  coords = vector4(-678.95, 5839.77, 17.33, 217.38),
  minusOne = true,
  freeze = true,
  invincible = true,
  blockevents = true,
  -- animDict = 'amb@world_human_aa_smoke@male@idle_a',
  -- anim = 'idle_a',
  scenario = 'WORLD_HUMAN_AA_SMOKE',
  flag = 1,
  target = {
      options = {
      {
       type = "client",
       event = "hunting:shop",
       icon = 'fas fa-shopping-basket ',
       label = 'hunting shop',
      }
  },
  distance = 2.5,
}
},
[2] = { 
  model = 'csb_chef',
  coords = vector4(569.1, 2796.52, 42.02, 275.93),
  minusOne = true,
  freeze = true,
  invincible = true,
  blockevents = true,
  -- animDict = 'amb@world_human_aa_smoke@male@idle_a',
  -- anim = 'idle_a',
  scenario = 'WORLD_HUMAN_AA_SMOKE',
  flag = 1,
  target = {
      options = {
      {
       type = "client",
       event = "Dox-hunting:client:sell",
       icon = 'fas fa-shopping-basket ',
       label = 'sell',
      }
  },
  distance = 2.5,
  }
 },
 ```
