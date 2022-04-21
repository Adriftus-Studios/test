connect_bot:
    type: task
    debug: false
    script:
        # % ██ [ Manually start the bot                                  ] ██
        # % ██ [ Typically done "on server start" or relative to startup ] ██
        - ~discordconnect id:a_bot token:<secret[a_bot_token]>

players_command_create:
    type: task
    debug: false
    script:
        - ~discordcommand id:a_bot create name:players "description:Lists players on the network" group:626078288556851230

players_command_handler:
    type: world
    debug: false
    events:
        on discord slash command name:players:
        # % ██ [ Defer the interaction        ] ██
        - ~discordinteraction defer interaction:<context.interaction>

        - define embed <discord_embed>

        - foreach <bungee.list_servers> as:server:
            - ~bungeetag server:<[server]> <server.online_players.parse[name].formatted> save:players
            - if <entry[players].result.is_empty>:
                - foreach next
            - define embed <[embed].add_inline_field[<[server]>].value[<entry[players].result>]>

        # % ██ [ Public message parsing        ] ██
        - definemap embed_data:
            color: <color[0,254,255]>
            description: <[server_player_map].formatted.seperated_by[<&nl>]>
        - ~discordinteraction reply interaction:<context.interaction> <[embed].with_map[<[embed_data]>]>
