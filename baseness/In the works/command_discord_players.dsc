server_list:
  type: data
  debug: false
  servers: <bungee.list_servers>

script_name:
  type: task
  debug: false
  script:
    - ~discordconnect id:a_bot token:<secret[a_bot_token]>

players_command_create:
  type: task
  debug: false
  script:
    - ~discordcommand id:a_bot create name:players "description:Lists players on the servers" group:626078288556851230

players_command_handler:
  type: world
  debug: false
  events:
    on discord slash command name:players:
    # % ██ [ Defer the interaction        ] ██
    - ~discordinteraction defer interaction:<context.interaction>
    - foreach <bungee.list_servers> as:server:
      - bungeetag server:<[server]> <server.online_players.parse[name].formatted> save:players
    # % ██ [ Public message parsing        ] ██
    - definemap embed_data:
        color: <color[0,254,255]>
        description: <entry[players]>

    - ~discordinteraction reply interaction:<context.interaction> <discord_embed.with_map[<[embed_data]>]>