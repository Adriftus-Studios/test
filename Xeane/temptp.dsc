temp_tp:
  type: command
  debug: false
  name: temptp
  usage: /temptp
  script:
    - flag player packet_debug
    - execute as_player "minecraft:tp Xeane ~ ~ ~ ~ 10"
    - narrate "Denizen TP"
    - teleport <player.location.with_pitch[10]>
    - flag player packet_debug:!

temptp_capture:
  type: world
  debug: false
  data:
    blacklist:
      ClientboundSystemChatPacket: true
      PacketPlayOutSetSlot: true
      PacketPlayOutCloseWindow: true
  events:
    on player receives packet flagged:packet_debug:
      - narrate <context.reflected_class.interpret> if:<script.data_key[data.blacklist.<context.class>].exists.not>