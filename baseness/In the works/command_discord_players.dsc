server_list:
    type: data
    debug: false
    servers: <bungee.list_servers>

connect_bot:
    type: task
    debug: false
    script:
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
        - foreach <bungee.list_servers> as:server:
            - ~bungeetag server:<[server]> <server.online_players.parse[name].formatted> save:players
            - define server_player_map:|:<map.with[<[server]>].as[<entry[players].result>]>
        # % ██ [ Public message parsing        ] ██
        - definemap embed_data:
            color: <color[0,254,255]>
            description: <[server_player_map]>
        - ~discordinteraction reply interaction:<context.interaction> <discord_embed.with_map[<[embed_data]>]>

# - Made by Behr

boom:
    type: task
    debug: false
    script:
        - foreach <bungee.list_servers> as:server:
            - ~bungeetag server:<[server]> <server.online_players.parse[name].formatted> save:players
            - define server_player_map:|:<map.with[<[server]>].as[<entry[players].result>]>