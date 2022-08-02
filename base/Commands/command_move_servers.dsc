go_to_test:
    type: command
    debug: false
    name: test
    description: Teleports player to the test server.
    usage: /test
    script:
        - if <player.has_flag[combat_tag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - if <server.flag[player_map.uuids.uuid.server]> == test:
            - run already_in_server
            - stop
        - adjust <player> send_to:test
        - teleport <player> <location[-2932,66,4048,world]>
#

go_to_hub:
    type: command
    debug: false
    name: hub
    description: Teleports player to the hub.
    usage: /hub
    script:
        - if <player.has_flag[combat_tag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - if <server.flag[player_map.uuids.uuid.server]> == hub:
            - run already_in_server
            - stop
        - adjust <player> send_to:hub
        - teleport <player> <location[0,78,0,4_buildings]>
#Works

go_to_herocraft:
    type: command
    debug: false
    name: herocraft
    description: Teleports player to the Herocraft SMP.
    usage: /herocraft
    script:
        - if <player.has_flag[combat_tag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - adjust <player> send_to:herocraft
        - if <server.flag[player_map.uuids.uuid.server]> == herocraft:
            - run already_in_server

already_in_server:
    type: task
    debug: false
    script:
        - narrate "<red>You are already in the server!"

#Mark spawn locations