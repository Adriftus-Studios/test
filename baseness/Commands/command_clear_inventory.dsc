clear_inventory:
    type: command
    debug: false
    name: Clearinventory
    description: Clears inventory.
    usage: /clearinventory <&lt>player<&gt>
    permission: adriftus.staff
    aliases:
        - ci
    tab completions:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.size> > 1:
            - narrate "<red>Too many arguments!"
        - if <context.args.size> < 1:
            - inventory clear destination:<player.inventory>
            - narrate "<yellow><bold>Your inventory has been cleared."
        - if <context.args.size> == 1:
            - inventory clear destination:<context.args.get[1].inventory>
            - narrate "<yellow><bold><context.args.get[1]>'s inventory has been cleared."
#Username case to be fixed