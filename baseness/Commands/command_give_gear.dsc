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

give_player_armor:
    type: command
    debug: false
    name: armor
    description: Gives the player a matching armor
    usage: /armor <&lt>leather/chainmail/iron/diamond/gold/netherite<&gt>
    tab completions:
        1: <script[gears_list].data_key[armors]>
    script:
        #Exclusion
        - if <context.args.get[1].equals[<script[gears_list].data_key[armors]>.not]> | <context.args.size.equals[0]> | <context.args.size.is_more_than[1]>:
            - narrate "<red>Invalid argument!"
            - stop
        #Execution
        - define material <context.args.get[1]>
        - give <[material]>_chestplate|<[material]>_helmet|<[material]>_leggings|<[material]>_boots

give_tool:
    type: command
    debug: false
    name: givetool
    description: Gives the player a tool of their choice.
    usage: /givetool <&lt>sword/pickaxe/axe/shovel/hoe<&gt> <&lt>wood/stone/iron/gold/diamond/netherite<&gt>
    tab completions:
        1: <script[gears_list].data_key[tools]>
        2: <script[gears_list].data_key[tool_material]>
    script:
        #Exclusion
        - if <context.args.get[1].equals[<script[gears_list].data_key[tools].not>]> | <context.args.get[2].equals[<script[gears_list].data_key[tool_material].not>]> | <context.args.size.equals[0]> | <context.args.size.is_more_than[1]>:
            - narrate "<red>Invalid argument!"
            - stop
        #Execution
        - define material <context.args.get[2]>
        - define tool <context.args.get[1]>
        - give <[material]>_<[tool]>
#pickaxe
#axe
#bow
#crossbow
#hoe
#shovel
#netherite