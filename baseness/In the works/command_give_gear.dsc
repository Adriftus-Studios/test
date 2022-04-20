gears_list:
    type: data
    debug: false
    armors:
        - leather
        - chainmail
        - iron
        - diamond
        - gold
        - netherite
    tool_material:
        - wooden
        - stone
        - iron
        - gold
        - diamond
        - netherite
    tools:
        - sword
        - pickaxe
        - axe
        - shovel
        - hoe
#

give_player_armor:
    type: command
    debug: false
    name: armor
    description: Gives the player a matching armor
    usage: /armor <&lt>leather/chainmail/iron/diamond/gold/netherite<&gt>
    tab completions:
        1: <script[gears_list].data_key[armors]>
        2: wear
    #permission: adriftus.give.armor
    script:
        #Exclusion
        - if !(<context.args.get[1]> == <script[gears_list].data_key[armors]>) | <context.args.size> == 0 | <context.args.size> > 1:
            - narrate "<red>Invalid argument!"
            - stop
        - else if <player.has_equipped[*_chestplate|*_boots|*_helmet|*_leggings]>:
            - narrate "<red>You must be unarmored to be able to wear the selected armor!"
            - stop
        #Execution
        - define material <context.args.get[1]>
        - define chest <[material]>_chestplate
        - define head <[material]>_helmet
        - define legs <[material]>_leggings
        - define boots <[material]>_boots
        #Choice to equip
        - if !(<context.args.get[2]> == wear):
            - give <[chest]>|<[legs]>|<[head]>|<[boots]>
            - narrate "You have received the <[material]> armor set!"
        - else if <context.args.get[2].equals[wear]>:
            - equip boots:<[boots]> chest:<[chest]> head:<[head]> legs:<[legs]>
            - narrate "You have fully equipped the <[material].to_sentence_case> armor set!"
# - Fix tab completions

give_tool:
    type: command
    debug: false
    name: givetool
    description: Gives the player a tool of their choice.
    usage: /givetool <&lt>sword/pickaxe/axe/shovel/hoe<&gt> <&lt>wood/stone/iron/gold/diamond/netherite<&gt>
    tab completions:
        1: <script[gears_list].data_key[tools]>
        2: <script[gears_list].data_key[tool_material]>
    #permission: adriftus.give.tool
    script:
        #Exclusion
        - if !(<context.args.get[1]> == <script[gears_list].data_key[tools]>) | <context.args.get[2]> == <script[gears_list].data_key[tool_material]> | <context.args.size> == 0 | <context.args.size> > 1:
            - narrate "<red>Invalid argument!"
            - stop
        #Execution
        - define material <context.args.get[2]>
        - define tool <context.args.get[1]>
        - give <[material]>_<[tool]>
        - narrate "<yellow><bold>You have received a <[material].to_sentence_case> <[tool].to_sentence_case>."
#

give_crossbow:
    type: command
    debug: false
    name: crossbow
    description: Gives the player a crossbow.
    usage: /crossbow
    #permission: adriftus.give.crossbow
    script:
        - give crossbow
        - narrate "<yellow><bold>You have received a bow."
#

give_bow:
    type: command
    debug: false
    name: bow
    description: Gives the player a bow.
    usage: /bow
    #permission: adriftus.give.bow
    script:
        - give bow
        - narrate "<yellow><bold>You have received a bow."
#