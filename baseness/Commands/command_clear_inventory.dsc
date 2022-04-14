clear_inventory:
    type: command
    debug: false
    name: Clearinventory
    description: Clears inventory.
    usage: /clearinventory <&lt>player<&gt>
    aliases:
        - ci
    tab completions:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.size> < 1:
            - inventory clear destination:<player.inventory>
            - narrate "<yellow><bold>Your inventory has been cleared."
        - if <context.args.size.equals[1]>:
            - inventory clear destination:<context.args.get[1].inventory>
            - narrate "<yellow><bold><context.args.get[1]>'s inventory has been cleared."
        - if <context.args.size.is_more_than[1]>:
            - narrate "<red>Too many arguments!"
#Username case to be fixed