food_crate_handler:
  type: world
  debug: false
  events:
    on player right clicks block with:food_crate:
      - determine passively cancelled
      - if <player.inventory.empty_slots> < 5:
        - narrate "<&c>You must have at least 5 open inventory slots to unpack a food crate."
        - stop
      - if <player.has_flag[opening_food_crate]>:
        - narrate "<&c>Please finish opening your current Food Crate."
        - stop
      - else:
        - flag <player> opening_food_crate duration:30s
        - take iteminhand quantity:1
        - repeat 5:
          - define item <server.flag[custom_food_data.valid_food].random>
          - give <[item]> quantity:1
          - narrate "<&e>You unpacked a <script[<[item]>].data_key[display<&sp>name].parsed><&e>."
          - playsound <player> sound:block_sand_hit sound_category:master pitch:0.5
          - wait <util.random.int[8].to[15]>t
        - flag <player> opening_food_crate:!

food_crate:
  type: item
  debug: false
  material: player_head
  mechanisms:
    skull_skin: 23c5b3f8-6ab5-464e-85e5-5c28ab9b893c|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7ImlkIjoiZjk1NjQ0NTgwN2QwNDJjOWI0OThjMGQ1NzZkYmNkYjEiLCJ0eXBlIjoiU0tJTiIsInVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjRkYTgzMDYwOTJjYzU0YWNlZDYyY2UyNjNmZjFmNTc0YTFmODkwZWE1OGRjNDMwMzBiYTUwNzk3MjZiYWIzOSIsInByb2ZpbGVJZCI6IjY5YzUxMDg3ODAzYjQ4NDViZWYxMTZlMTJjN2VhMjI1IiwidGV4dHVyZUlkIjoiYjRkYTgzMDYwOTJjYzU0YWNlZDYyY2UyNjNmZjFmNTc0YTFmODkwZWE1OGRjNDMwMzBiYTUwNzk3MjZiYWIzOSJ9fSwic2tpbiI6eyJpZCI6ImY5NTY0NDU4MDdkMDQyYzliNDk4YzBkNTc2ZGJjZGIxIiwidHlwZSI6IlNLSU4iLCJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2I0ZGE4MzA2MDkyY2M1NGFjZWQ2MmNlMjYzZmYxZjU3NGExZjg5MGVhNThkYzQzMDMwYmE1MDc5NzI2YmFiMzkiLCJwcm9maWxlSWQiOiI2OWM1MTA4NzgwM2I0ODQ1YmVmMTE2ZTEyYzdlYTIyNSIsInRleHR1cmVJZCI6ImI0ZGE4MzA2MDkyY2M1NGFjZWQ2MmNlMjYzZmYxZjU3NGExZjg5MGVhNThkYzQzMDMwYmE1MDc5NzI2YmFiMzkifSwiY2FwZSI6bnVsbH0=
  display name: <&b>Food Crate
  lore:
  - "<&e>Provides a heck of a meal!"
