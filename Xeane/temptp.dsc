temp_tp:
  type: command
  debug: false
  name: temptp
  usage: /temptp
  script:
    - flag player packet_debug
    - narrate "<&color[#010000]>Vanilla TP"
    - execute as_player "minecraft:tp Xeane ~ ~ ~ ~ 10"
    - narrate "<&color[#010000]>Denizen TP"
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
      - stop if:<script.data_key[data.blacklist.<context.class>].exists>
      - foreach <list[a|b|c|d|e|h]>:
        - narrate "<[value]><&co> <context.reflect_packet.read_field[<[value]>]>"