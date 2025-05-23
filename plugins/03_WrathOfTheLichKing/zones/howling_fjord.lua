-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local Map = ns.Map
local L = ns.locale

local Collectible = ns.node.Collectible
local Rare = ns.node.Rare
local Safari = ns.node.Safari
local Squirrel = ns.node.Squirrel

local Achievement = ns.reward.Achievement
local Transmog = ns.reward.Transmog

local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({id = 117, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[72805140] = Rare({
    id = 32386,
    rewards = {
        Achievement({id = 2257, criteria = 8}), -- Frostbitten
        Transmog({item = 44670, slot = L['plate']}) -- Soul-Sealed Belt
    },
    pois = {
        POI({
            68004480, 69404900, 70605160, 71205540, 69005880, 72806180,
            74406060, 75005800, 74605580, 74805480, 74805100, 75204980,
            72804900, 71604660, 72004360, 73604060, 75604380
        })
    },
    note = L['area_spawn']
}) -- Vigdis the War Maiden

local Perobas = Rare({
    id = 32377,
    fgroup = 'perobas',
    rewards = {
        Achievement({id = 2257, criteria = 7}), -- Frostbitten
        Transmog({item = 44669, slot = L['mail']}) -- Worgen-Scored Shackles
    }
}) -- Perobas the Bloodthirster

map.nodes[60602000] = Perobas
map.nodes[53601240] = Perobas
map.nodes[50240493] = Perobas -- position confirmed
map.nodes[68801700] = Perobas
map.nodes[71601360] = Perobas

local KingPing = Rare({
    id = 32398,
    fgroup = 'kingping',
    rewards = {
        Achievement({id = 2257, criteria = 9}), -- Frostbitten
        Transmog({item = 44668, slot = L['cloth']}) -- Egg-Warming Blanket
    }
}) -- King Ping

map.nodes[31205680] = KingPing
map.nodes[26006400] = KingPing
map.nodes[30807120] = KingPing
map.nodes[32207540] = KingPing
map.nodes[33208020] = KingPing

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS WHO SHARED MY LIFE -------------------
-------------------------------------------------------------------------------

map.nodes[21095563] = Squirrel({
    id = 28407,
    rewards = {Achievement({id = 2557, criteria = 3})}
}) -- Fjord Penguin

map.nodes[36287932] = Squirrel({
    id = 26503,
    rewards = {Achievement({id = 2557, criteria = 10})}
}) -- Scalawag Frog

map.nodes[69266450] = Squirrel({
    id = 24746,
    rewards = {Achievement({id = 2557, criteria = 4})}
}) -- Fjord Turkey

map.nodes[68006350] = Squirrel({
    id = 17467,
    rewards = {Achievement({id = 1206, criteria = 16})}
}) -- Skunk

map.nodes[52506660] = Squirrel({
    id = 1420,
    rewards = {Achievement({id = 1206, criteria = 20})}
}) -- Toad

map.nodes[33787837] = Squirrel({
    id = 1420,
    note = L['in_cave'],
    rewards = {Achievement({id = 1206, criteria = 20})},
    pois = {POI({33577564})}
}) -- Sheep

-------------------------------------------------------------------------------
-------------------------------- PEST CONTROL ---------------------------------
-------------------------------------------------------------------------------

map.nodes[69266550] = Collectible({
    id = 24174,
    icon = 132196,
    rewards = {Achievement({id = 2556, criteria = 15})}
}) -- Fjord Turkey

map.nodes[57205650] = Collectible({
    id = 24270,
    icon = 132196,
    note = L['note_devouring_maggot'],
    rewards = {Achievement({id = 2556, criteria = 6})},
    pois = {POI({56624889})}
}) -- Devouring Maggot

map.nodes[50265509] = Collectible({
    id = 16030,
    icon = 132196,
    label = '{npc:2914}, {npc:16030}',
    rewards = {Achievement({id = 2556, criteria = {10, 13}})}
}) -- Snake, Maggot

map.nodes[59207730] = Collectible({
    id = 4075,
    icon = 132196,
    rewards = {Achievement({id = 2556, criteria = 18})}
}) -- Rat

-------------------------------------------------------------------------------
------------------------------- FRIEND OR FOWL? -------------------------------
-------------------------------------------------------------------------------

map.nodes[69266550] = Collectible({
    id = 24746,
    icon = 133971,
    note = L['achievement_friend_or_fowl_desc'],
    rewards = {Achievement({id = 1254})}
}) -- Fjord Turkey

-------------------------------------------------------------------------------
------------------------------------ SAFARI -----------------------------------
-------------------------------------------------------------------------------

map.nodes[30804460] = Safari.Chicken({
    pois = {
        POI({
            30404120, 30604220, 30804460, 31004380, 31604140, 31804360, 32204220
        })
    }
}) -- Chicken

map.nodes[57005640] = Safari.DevouringMaggot({
    note = L['note_devouring_maggot'],
    pois = {
        POI({
            56205680, 56405640, 56805400, 56805660, 57005480, 57005640, 57605660
        }), POI({56624889})
    }
}) -- Devouring Maggot

map.nodes[68802580] = Safari.FjordRat({
    pois = {
        POI({
            30404400, 31204200, 44203580, 56405040, 56405060, 56605020,
            56605320, 57005700, 57205440, 57205460, 57205600, 57805520,
            58205180, 58405300, 58605120, 58605300, 58605480, 58803820,
            58805580, 59005240, 59205000, 59805000, 67002680, 67803240,
            68202960, 68802580, 70802820, 75803380, 77203140, 81604160
        })
    }
}) -- Fjord Rat

map.nodes[30605700] = Safari.FjordWorgPup({
    pois = {
        POI({
            26406080, 26606100, 27006240, 27006260, 27205740, 27205780,
            27806020, 27806340, 28005620, 28205800, 28205860, 28206380,
            28406140, 28406160, 28606160, 29006440, 29006460, 29205660,
            29206040, 29206060, 29206260, 29405620, 29405820, 29405940,
            29605580, 29806800, 30206220, 30206940, 30206960, 30405680,
            30405840, 30405900, 30406500, 30605700, 30605880, 30806780,
            30806900, 31006420, 31405780, 31406220, 31605760, 31606220,
            31606260, 31806000, 31806540, 31806560, 32206700, 32606180,
            32606340, 32806140, 32806500, 33005920, 33205960, 33406360,
            33606220, 33606340, 33606360
        })
    }
}) -- Fjord Worg Pup

map.nodes[50205500] = Safari.Maggot({
    pois = {POI({49605420, 50205500, 50805440, 50805460})}
}) -- Maggot

map.nodes[43603640] = Safari.Rat({
    pois = {POI({43402920, 43603640, 44602760, 45802700})}
}) -- Rat

map.nodes[42607500] = Safari.ShoreCrab({
    pois = {
        POI({
            30407160, 31205620, 31207160, 31607120, 31807440, 32205760,
            32206880, 34406180, 34406440, 42607500, 77002120, 77602180,
            78202340, 80003440, 80203460, 80403240, 81403860
        })
    }
}) -- Shore Crab

map.nodes[50803320] = Safari.Skunk({
    pois = {
        POI({
            33804720, 34603120, 35804480, 38402920, 38402960, 40603100,
            40803400, 41202860, 42604380, 44204480, 46405000, 46605000,
            46606560, 50407240, 50604160, 50803320, 55606560, 57407060,
            59002580, 65402620, 65602620, 72002700, 72406200, 72804560,
            74604840, 76406420
        })
    }
}) -- Skunk

map.nodes[43804380] = Safari.Squirrel({
    pois = {POI({28806400, 39804140, 43804380, 45804380, 66004600})}
}) -- Squirrel

map.nodes[43804380] = Safari.Turkey({
    pois = {
        POI({
            30404120, 30604220, 31004380, 31004500, 31604140, 31804360,
            32204240, 58006140, 58406340, 58806200, 59406060, 59406340,
            59406360, 59606280, 59806140, 59806160, 60006040, 60206380, 60606280
        })
    }
}) -- Turkey
