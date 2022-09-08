## random equipment utils for your convenience

random_basic_helmet:
    type: procedure
    data: <list[leather|chainmail|iron|golden]>
    script:
        - determine <script.data_key[data].random>_helmet
random_helmet:
    type: procedure
    script:
        - determine <script[random_basic_helmet].data_key[data].include[netherite|diamond].random>_helmet

random_basic_chestplate:
    type: procedure
    data: <list[leather|chainmail|iron|golden]>
    script:
        - determine <script.data_key[data].random>_chestplate
random_chestplate:
    type: procedure
    script:
        - determine <script[random_basic_chestplate].data_key[data].include[netherite|diamond].random>_chestplate

random_basic_leggings:
    type: procedure
    data: <list[leather|chainmail|iron|golden]>
    script:
        - determine <script.data_key[data].random>_leggings
random_leggings:
    type: procedure
    script:
        - determine <script[random_basic_leggings].data_key[data].include[netherite|diamond].random>_leggings

random_basic_boots:
    type: procedure
    data: <list[leather|chainmail|iron|golden]>
    script:
        - determine <script.data_key[data].random>_boots
random_boots:
    type: procedure
    script:
        - determine <script[random_basic_boots].data_key[data].include[netherite|diamond].random>_boots

random_basic_sword:
    type: procedure
    data: <list[wooden|stone|iron|golden]>
    script:
        - determine <script.data_key[data].random>_sword
random_sword:
    type: procedure
    script:
        - determine <script[random_basic_sword].data_key[data].include[netherite|diamond].random>_sword

random_basic_pickaxe:
    type: procedure
    data: <list[wooden|stone|iron|golden]>
    script:
        - determine <script.data_key[data].random>_pickaxe
random_pickaxe:
    type: procedure
    script:
        - determine <script[random_basic_pickaxe].data_key[data].include[netherite|diamond].random>_pickaxe

random_basic_axe:
    type: procedure
    data: <list[wooden|stone|iron|golden]>
    script:
        - determine <script.data_key[data].random>_axe
random_axe:
    type: procedure
    script:
        - determine <script[random_basic_axe].data_key[data].include[netherite|diamond].random>_axe

random_basic_shovel:
    type: procedure
    data: <list[wooden|stone|iron|golden]>
    script:
        - determine <script.data_key[data].random>_shovel
random_shovel:
    type: procedure
    script:
        - determine <script[random_basic_shovel].data_key[data].include[netherite|diamond].random>_shovel

random_basic_hoe:
    type: procedure
    data: <list[wooden|stone|iron|golden]>
    script:
        - determine <script.data_key[data].random>_hoe
random_hoe:
    type: procedure
    script:
        - determine <script[random_basic_hoe].data_key[data].include[netherite|diamond].random>_hoe

random_basic_armor:
    type: procedure
    script:
        - definemap equipment:
            helmet: <proc[random_basic_helmet]>
            chestplate: <proc[random_basic_chestplate]>
            leggings: <proc[random_basic_leggings]>
            boots: <proc[random_basic_boots]>
        - determine <[equipment]>
random_armor:
    type: procedure
    script:
        - definemap equipment:
            helmet: <proc[random_helmet]>
            chestplate: <proc[random_chestplate]>
            leggings: <proc[random_leggings]>
            boots: <proc[random_boots]>
        - determine <[equipment]>

random_basic_tool:
    type: procedure
    script:
        - determine <list[<proc[random_basic_sword]>|<proc[random_basic_axe]>|<proc[random_basic_shovel]>|<proc[random_basic_hoe]>|<proc[random_basic_pickaxe]>].random>
random_tool:
    type: procedure
    script:
        - determine <list[<proc[random_sword]>|<proc[random_axe]>|<proc[random_shovel]>|<proc[random_hoe]>|<proc[random_pickaxe]>].random>
