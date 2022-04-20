see_inventory:
    type: command
    debug: false
    name: see_inventory
    description: Displays the inventory of a player.
    usage: /see_inventory <&lt>name<&gt>
    aliases:
        - si
    tab completion:
        1: <server.online_players.parse[name]>
    script:
        - flag <player> seeing_inventory:<context.args.get[1].inventory.list_contents>
        - flag <player> si_who:<context.args.get[1]>
        - if <context.args.size> < 1:
            - inventory open destination:<player>
            - stop
        - define player <server.match_player[<context.args.get[1]>]>
        #.if_null[null]>
        #- if <[player]> = null:
        #    - narrate "<red>Use an online player's name.<reset>"
        #    - stop
        - inventory open destination:<[player].inventory>
        - narrate "<yellow>Opening inventory<reset>"
see_inventory_world:
    type: world
    debug: false
    events:
        on player left|right clicks item in inventory flagged:seeing_inventory:
            - determine passively cancelled
            - foreach <player.flag[seeing_inventory]>:
                - adjust <player.flag[si_who].inventory.list_contents> contents:<player.flag[seeing_inventory]>
            - if <context.inventory.location.material.name.equals[shulker_box]>:
                - inventory open destination:<context.item.inventory>
            - if <context.item> == <context.item_in_hand>:
                - inventory adjust <context.item> slot:<player.held_item_slot>
        on player closes inventory flagged:seeing_inventory:
            - flag <player> seeingInventory:!
            - inventory swap origin:<context.inventory> destination:<context.inventory>

# Idea -
#   - Displays inventory of any player, offline and online.
#   - Inventory should only be for view.
#   - Shulkers, upon click, should be displayed
#   - Ender chest button to see the player's inventory
# Issues -
#   - Inventory disappears if interacted with (should be adjusted manually)