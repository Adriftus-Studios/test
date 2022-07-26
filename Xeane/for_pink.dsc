for_pink:
  type: world
  debug: false
  events:
    on player joins:
      - if <player.uuid> == 2a2810c5-1924-461c-9ea7-94d9f8d2c91f:
        - rename IBeeVibin t:<player>
        - determine "<&e>IBeeVibin has joined the server"