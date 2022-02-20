christmas_socks_packet:
  type: item
  debug: false
  material: player_head
  mechanisms:
    skull_skin: 3167ba84-a532-4956-9db3-a312e2aaa12e|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzQzMDBhNWY4MTExNzUzZmI5ZTIyNGQ2MGU0NmQ0NmZiYjAzY2YzZjA5NzRiM2RlZTQzODg3ZWE1ZmYwMWZjYiJ9fX0=
  display name: <&6>Box of Socks
  lore:
  - <&e>Right click to recieve the contents!

christmas_socks_packet_opener:
  type: world
  debug: false
  events:
    on player right clicks block with:christmas_socks_packet:
      - ratelimit <player> 2t
      - determine passively cancelled
      - take iteminhand
      - playsound sound:BLOCK_grass_hit <player> pitch:0.5
      - give christmas_socks_baseball
      - narrate "<&6>You recieved <&e><item[christmas_socks_baseball].display>"
      - wait 20t
      - playsound sound:BLOCK_grass_hit <player> pitch:0.5
      - give christmas_socks_red_leaping
      - narrate "<&6>You recieved <&e><item[christmas_socks_red_leaping].display>"
