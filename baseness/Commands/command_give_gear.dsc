gears_list:
    type: data
    armors:
        - leather
        - chainmail
        - iron
        - diamond
        - gold
        - netherite
    tools:
        - wood
        - stone
        - iron
        - gold
        - diamond
        - netherite

give_player_armor:
    type: command
    name: armor
    description: Gives the player a matching armor
    usage: /armor <&lt>leather/chainmail/iron/diamond/gold/netherite<&gt>
    tab completions:
        1: <script[gears_list].data_key[armors]>
    script:
        #Exclusions
        - if <context.args[1].equals[<script[gears_list].data_key[armors]>.not]>:
            - narrate "<red>Invalid argument!"
        - define material <context.args.get[1]>
        - give <[material]>_chestplate|<[material]>_helmet|<[material]>_leggings|<[material]>_boots

#pickaxe
#axe
#bow
#crossbow
#hoe
#shovel
#netherite