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