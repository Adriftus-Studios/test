wireless_lever:
  type: item
  debug: false
  material: lever
  display: <&c>Wireless Lever
  lore:
  - <&e>Connects up to 2 chunks away
  - <&e>Sneak Right Click to link
  - <&e>Place once Linked
  - <&c>DOES NOT WORK ON REDSTONE WIRE
  flags:
    on_right_click: wireless_lever_handle
    on_place: wireless_lever_place

wireless_lever_handle:
  type: task
  debug: false
  script:
    - if <player.is_sneaking> && <context.location.exists>:
      - inventory flag slot:<player.held_item_slot> linked_location:<context.location>

wireless_lever_place:
  type: task
  debug: false
  script:
    - wait 1t
    - if <context.location.material.name> == lever:
      - flag <context.location> on_break:wireless_lever_broken
      - flag <context.location> on_right_click:wireless_lever_toggle
      - flag <context.location> linked_location:<context.item.flag[linked_location]>

wireless_lever_toggle:
  type: task
  debug: false
  script:
    - if <context.location.material.switched>:
      - if <context.location.flag[linked_location].material.switched.exists>:
        - switch <context.location.flag[linked_location]> state:off
      - else:
        - switch <context.location.flag[linked_location]> state:on

wireless_lever_broken:
  type: task
  debug: false
  script:
    - flag <context.location> on_break:!
    - flag <context.location> on_right_click:!
    - flag <context.location> linked_location:!