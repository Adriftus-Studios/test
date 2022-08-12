temp_tp:
  type: command
  debug: false
  name: temptp
  usage: /temptp
  script:
    - flag player packet_debug
    - execute as_player "minecraft:tp Xeane ~ ~ ~ ~ 10"
    - flag player packet_debug:!

temptp_capture:
  type: world
  debug: false
  events:
    on player receives packet class:PacketPlayOutPosition flagged:packet_debug:
      - narrate <context.class>