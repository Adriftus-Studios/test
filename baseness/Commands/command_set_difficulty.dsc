set_difficulty:
    type: command
    debug: false
    name: Setdifficulty
    description: Sets difficulty of the world.
    usage: /setdifficulty
    aliases:
        - sd
    permission: adriftus.set_difficulty
    data:
        difficulty:
            - peaceful
            - easy
            - normal
            - hard
    tab completions:
        1: <server.worlds.parse[name]>
        2: peaceful|easy|normal|hard
    script:
        # Exclusions
        # - Too little arguments
        - if <context.args.size> < 1:
            - narrate "<red>Set the difficulty of the world (peaceful, easy, normal, hard)."
            - stop
        # - Already set difficulty value
        - else if <context.args.get[2]> == <world[<context.args.get[1]>].difficulty>:
            - narrate "<yellow><bold>Difficulty already set to <context.args.get[2]> in world [<context.args.get[1]>]!"
            - stop
        # - Doesn't match either world name or difficulty name
        - else if !<server.worlds.parse[name].contains[<context.args.get[1]>]> || !<script.data_key[difficulty].contains[<context.args.get[2]>]>:
            - narrate "<red>Invalid input!"
            - stop
        # - Too many arguments
        - else if <context.args.size> > 2:
            - narrate "<red>Too many arguments!"
            - stop
        # Execution
        - adjust <world[<context.args.get[1]>]> difficulty:<context.args.get[2]>
        - narrate "<yellow><bold>Difficulty set to <context.args.get[2]> in world [<context.args.get[1]>]."
#