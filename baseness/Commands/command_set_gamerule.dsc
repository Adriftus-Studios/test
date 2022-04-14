set_gamerule:
    type: command
    name: Gamerule
    description: Set the gamerule.
    debug: false
    usage: /gamerule <&lt>world<&gt> <&lt>gamerule<&gt> <&lt>true/false/toggle<&gt>
    aliases:
        - gr
    tab completions:
        1: <server.worlds.parse[name]>
        2: <server.gamerules>
        3: true|false|toggle
    script:
        # No arguments
        - if <context.args.size.is_less_than[1]>:
            - narrate "<red>Too little arguments!<reset>"
        # Gamerule input
        - if <server.gamerules.contains_any[<context.args.get[2]>].not>:
            - narrate "<red>Invalid input! [NOTE: Gamerules are case-sensitive! Refer to the tab completions.]<reset>"
        # Toggle
        - if <context.args.get[3].equals[toggle]>:
            - gamerule <player.world.name> <context.args.get[2]> <world[<player.world.name>].gamerule[<context.args.get[2]>].not>
            - narrate "Gamerule <context.args.get[2]> set to <world[<player.world.name>].gamerule[<context.args.get[2]>]>"
        # True or false
        - else if <context.args.get[3].equals[true]> || <context.args.get[2].equals[false]>:
            - gamerule <player.world.name> <context.args.get[2]> <context.args.get[3]>
            - narrate "<context.args.get[3]> set to <world[<player.world.name>].gamerule[<context.args.get[2]> in]>"
        - else narrate "Invalid input!"
        # Too many arguments
        - if <context.args.size.is_more_than[3]>:
            - narrate "<red>Too many arguments!<reset>"
# Search improvements - input to be checked within statements