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
      - take iteminhand quantity:1
      - wait 1t
      - if <context.location.material.name> == lever:
        - flag <context.location> on_break:wireless_lever_broken
        - flag <context.location> on_physics:wireless_lever_physics
        - flag <context.location> on_liquid_spreads:wireless_lever_liquid
        - flag <context.location> on_explodes:wireless_lever_explode
        - flag <context.location> on_right_click:wireless_lever_toggle
        - flag <context.location> linked_location:<[location]>
      - else:
        - give wireless_lever

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
    - ratelimit <context.location> 1t
    - determine passively NOTHING
    - define switched <context.location.material.switched>
    - wait 1t
    - if <context.location.material.name> != lever:
      - if <[switched]>:
        - modifyblock <context.location.flag[linked_location]> air
        - flag <context.location.flag[linked_location]> on_break:!
        - flag <context.location.flag[linked_location]> on_pistoned:!
      - flag <context.location> on_break:!
      - flag <context.location> on_right_click:!
      - flag <context.location> linked_location:!
      - flag <context.location> on_physics:!
      - flag <context.location> on_liquid_spreads:!
      - flag <context.location> on_explode:!
      - drop <item[wireless_lever]> quantity:1 <context.location>

wireless_lever_physics:
  type: task
  debug: false
  script:
    - ratelimit <context.location> 1t
    - define switched <context.location.material.switched>
    - modifyblock <context.location> air if:<context.new_material.name.equals[lever].not>
    - wait 1t
    - if <context.location.material.name> != lever:
      - if <[switched]>:
        - modifyblock <context.location.flag[linked_location]> air
        - flag <context.location.flag[linked_location]> on_break:!
        - flag <context.location.flag[linked_location]> on_pistoned:!
      - flag <context.location> on_break:!
      - flag <context.location> on_right_click:!
      - flag <context.location> linked_location:!
      - flag <context.location> on_physics:!
      - flag <context.location> on_liquid_spreads:!
      - flag <context.location> on_explode:!
      - drop <item[wireless_lever]> quantity:1 <context.location>

wireless_lever_liquid:
  type: task
  debug: false
  script:
    - ratelimit <context.destination> 1t
    - define switched <context.destination.material.switched>
    - modifyblock <context.destination> air if:<context.new_material.name.equals[lever].not>
    - wait 1t
    - if <context.destination.material.name> != lever:
      - if <[switched]>:
        - modifyblock <context.destination.flag[linked_location]> air
        - flag <context.destination.flag[linked_location]> on_break:!
        - flag <context.destination.flag[linked_location]> on_pistoned:!
      - flag <context.destination> on_break:!
      - flag <context.destination> on_right_click:!
      - flag <context.destination> linked_location:!
      - flag <context.destination> on_physics:!
      - flag <context.destination> on_liquid_spreads:!
      - flag <context.destination> on_explode:!
      - drop <item[wireless_lever]> quantity:1 <context.destination>

wireless_lever_explode:
  type: task
  debug: false
  script:
    - ratelimit <context.block> 1t
    - define switched <context.block.material.switched>
    - modifyblock <context.block> air if:<context.new_material.name.equals[lever].not>
    - wait 1t
    - if <context.block.material.name> != lever:
      - if <[switched]>:
        - modifyblock <context.block.flag[linked_location]> air
        - flag <context.block.flag[linked_location]> on_break:!
        - flag <context.block.flag[linked_location]> on_pistoned:!
      - flag <context.block> on_break:!
      - flag <context.block> on_right_click:!
      - flag <context.block> linked_location:!
      - flag <context.block> on_physics:!
      - flag <context.block> on_liquid_spreads:!
      - flag <context.block> on_explode:!
      - drop <item[wireless_lever]> quantity:1 <context.block>

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