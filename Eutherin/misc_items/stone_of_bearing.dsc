stone_of_bearing:
  type: item
  material: stone
  debug: false
  display name: <&4>Stone of Bearing
  lore:
  - well how did you get this?
  flags:
    - unique:<util.random.duuid>
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|ink_sack|air
      - glow_ink_sac|stone|glow_ink_sac
      - air|ink_sack|air

stone_of_bearing_events:
  type: world
  debug: false
  events:
    on player drops stone_of_bearing:
      - if <context.item.flag[creator]> != <player>:
        - stop
      - determine cancelled
    on player swaps items:
      - if <context.main.script.name> == stone_of_bearing || <context.offhand.script.name> == stone_of_bearing:
        - stop
    on player clicks stone_of_bearing in inventory:
      - if <context.item.flag[creator]> != <player>:
        - stop
      - determine cancelled
    on player crafts stone_of_bearing:
      - flag <context.item> creator:<player>
