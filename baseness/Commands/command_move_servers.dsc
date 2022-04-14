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
        - adjust <player> send_to:test
        - if <server.flag[player_map.uuids.uuid.server].equals[test]>:
            - narrate "<bold><red>You are already in test!"
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
        - adjust <player> send_to:hub
        - if <server.flag[player_map.uuids.uuid.server].equals[hub]>:
            - narrate "<bold><red>You are already in hub!"
        - teleport <player> <location[0,78,0,4_buildings]>
#Works