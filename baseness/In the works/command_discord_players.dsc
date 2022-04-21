players_DCommand:
    type: world
    debug: false
    events:
        on discord message received for:AdriftusBot:
            - define message <context.message>
            - define author <context.author>
            - define channel <context.channel>
            - if <[message].contains_all_text[/players]>:
                - ~discordmessage id:AdriftusBot channel:<[channel]> Testing no_mention
network_players_list:
    type: task
    debug: false
    script:
        - foreach <bungee.list_servers> as:server:
            - bungeetag server:<[server]> <server.online_players.parse[name].formatted> save:players
            - narrate <entry[players]>

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