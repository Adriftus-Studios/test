temp_tp:
  type: task
  debug: false
  definitions: pitch
  script:
    - flag player recoil
    - narrate "<&color[#010000]>Denizen Relative TP"
    - teleport <location[0,0,0,0,<[pitch]>,<player.location.world>]>
    - flag player recoil:!

##PacketPlayOutPosition
temptp_capture:
  type: world
  debug: false
  data:
    blacklist:
      ClientboundSystemChatPacket: true
      PacketPlayOutSetSlot: true
      PacketPlayOutCloseWindow: true
  events:
    on player receives packet class:PacketPlayOutPosition flagged:recoil:
        - reflectionset object:<context.reflect_packet> field:f "value:X, Y, Z, X, Y_ROT"