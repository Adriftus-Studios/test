christmas_sweater_Reindeer:
  type: item
  debug: false
  material: leather_chestplate
  display name: <&6>Reindeer Sweater
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent Event.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&6>Dyable
  mechanisms:
    custom_model_data: 1
    unbreakable: true
    hides: all
    color: 125,255,125
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_sweater_snowman:
  type: item
  debug: false
  material: leather_chestplate
  display name: <&6>Snowman Sweater
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent Event.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&6>Dyable
  mechanisms:
    custom_model_data: 2
    unbreakable: true
    hides: all
    color: 125,125,255
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_sweater_tree:
  type: item
  debug: false
  material: leather_chestplate
  display name: <&6>Tree Sweater
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent Event.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&6>Dyable
  mechanisms:
    custom_model_data: 3
    unbreakable: true
    hides: all
    color: 255,125,125
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_sweater_box:
  type: item
  debug: false
  material: player_head
  mechanisms:
    skull_skin: 3167ba84-a532-4956-9db3-a312e2aaa12e|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDA3ZDMyMjQxOWNhMGNjMTlmZmFiNzBkMTVhMTU0NTQ4MTM0YWEwMjEwNjdmN2NjMTBkYjUxN2EwMjc4Mzc4MiJ9fX0=
  display name: <&6>Christmas Sweater box
  lore:
  - <&6>Could contain<&co> <&e>Snowman<&6>, <&e>Tree<&6>, or <&e>Reindeer!

christmas_sweater_box_opener:
  type: world
  debug: false
  events:
    on player right clicks block with:christmas_sweater_box:
      - ratelimit <player> 2t
      - determine passively cancelled
      - take iteminhand
      - playsound sound:BLOCK_grass_hit <player> pitch:0.5
      - define sweater <list[christmas_sweater_tree|christmas_sweater_snowman|christmas_sweater_reindeer].random>
      - give <[sweater]>
      - narrate "<&6>You recieved a <&e><item[<[sweater]>].display>"
      - wait 20t
