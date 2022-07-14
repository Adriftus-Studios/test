push_command:
    type: command
    name: push
    debug: false
    description: Does something
    usage: /push (player) (force)
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_player[<context.args.first>].if_null[null]>
    - define location <[target].location>
    - define force <context.args.get[2]>
    - define self <player.location>
    - if <context.args.size> == 0:
        - adjust <player> velocity:<[self].with_pitch[<[self]>].direction.vector.mul[-10]>
        - stop
    - if !<[target]> == null:
        - narrate "<&color[#010000]>Unknown Player<&co> <context.args.first>, dumbass"
        - stop
    - else if <context.args.size> == 1:
        - adjust <[target]> velocity:<[self].with_pitch[<[self]>].direction.vector.mul[-10]>
    - else if <context.args.size> == 2:
        - adjust <[target]> velocity:<[self].with_pitch[<[self]>].direction.vector.mul[-<[force]>]>