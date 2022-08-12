temp_tp:
  type: command
  debug: false
  name: temptp
  usage: /temptp
  script:
    - flag player packet_debug
    - teleport <player.location>
    - flag player packet_debug:!

temptp_capture:
  type: world
  debug: false
  events:
    on player receives packet flagged:packet_debug:
      - narrate <context.class>