wireless_lever:
  type: item
  debug: false
  material: lever
  display name: <&c>Wireless Lever
  lore:
  - <&e>Connects up to 2 chunks away
  - <&e>Sneak Right Click to link
  - <&e>Place once Linked
  - <&c>Creates a redstone block at linked location
  flags:
    on_place: wireless_lever_handle

wireless_lever_handle:
  type: task
  debug: false
  script:
    - if <player.is_sneaking>:
      - inventory flag slot:<player.held_item_slot> linked_location:<context.location>
      - narrate "<&a>Location Linked<&co> <&r><context.location.simple>"
      - determine cancelled
    - else:
      - if !<context.item_in_hand.has_flag[linked_location]>:
        - narrate "<&c>Wireless Lever has no linked location"
        - determine cancelled
      - define location <context.item_in_hand.flag[linked_location]>
      - wait 1t
      - if <context.location.material.name> == lever:
        - flag <context.location> on_break:wireless_lever_broken
        - flag <context.location> on_physics:wireless_lever_broken
        - flag <context.location> on_right_click:wireless_lever_toggle
        - flag <context.location> linked_location:<[location]>

wireless_lever_toggle:
  type: task
  debug: false
  script:
    - if <context.location.material.switched.exists>:
      - if <context.location.material.switched>:
        - modifyblock <context.location.flag[linked_location]> air
        - flag <context.location.flag[linked_location]> on_break:!
        - flag <context.location.flag[linked_location]> on_pistoned:!
      - else:
        - modifyblock <context.location.flag[linked_location]> redstone_block
        - flag <context.location.flag[linked_location]> on_break:determine_nothing
        - flag <context.location.flag[linked_location]> on_pistoned:cancel

wireless_lever_broken:
  type: task
  debug: false
  script:
    - wait 1t
    - if <context.location.material.name> != lever:
      - flag <context.location> on_break:!
      - flag <context.location> on_right_click:!
      - flag <context.location> linked_location:!
      - flag <context.location> on_physics:!

wireless_lever_determine_0:
  type: task
  debug: false
  script:
    - determine 0

wireless_lever_determine_1:
  type: task
  debug: false
  script:
    - determine 1