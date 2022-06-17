custom_object_fixer:
  type: task
  debug: false
  definitions: object
  script:
    - define object <context.entity> if:<[object].exists.not>
    - if <[object].has_flag[barriers]>:
      - flag <[object].has_flag[barriers]> on_right_click:<context.entity.flag[right_click_script]>

custom_object_place:
  type: task
  debug: false
  definitions: type|location
  script:
    - define type <context.item.flag[custom_object]> if:<[type].exists.not>
    - define location <context.location.center.above[0.51].with_yaw[<player.location.yaw.round_to_precision[90]>]> if:<[location].exists.not>
    # Solid ground check
    - if !<[location].below.material.is_solid> || <[location].below.material.name> == barrier:
      - narrate "<&c>Must be placed on solid ground."
      - stop
    # Check for script
    - if !<script[custom_object_<[type]>].exists>:
      - narrate "<&c>This item seems to be broken? Please report this and turn the item over to moderation."
      - stop
    
    - define script <script[custom_object_<[type]>]>
    - define barriers <[script].parsed_key[barrier_locations]>

      # Check barrier locations for blocks
    - if <[barriers].filter[material.name.contains_text[air].not].size> >= 1:
      - narrate "<&c>Not enough room."
      - stop
      
      # Continue with defines
    - define interaction <[script].parsed_key[interaction]>
    - define entity <[script].parsed_key[entity]>
    - define item <[script].parsed_key[item]>
    - spawn <[entity]> <[location]> save:object
    - modifyblock <[barriers]> barrier
    - flag <[barriers]> on_right_click:<[interaction]>
    - flag <[barriers]> custom_object:<entry[object].spawned_entity>
    - flag <entry[object].spawned_entity> barriers:<[barriers]>
    - flag <entry[object].spawned_entity> item:<[item]>
    - take iteminhand quantity:1

custom_object_remove:
  type: task
  debug: false
  definitions: object
  script:
    - define object <context.item.flag[entity]> if:<[object].exists.not>
    - flag <[object].flag[barriers]> on_right_click:!
    - flag <[object].flag[barriers]> custom_object:!
    - modifyblock <[object].flag[barriers]> air
    - give <[object].flag[item]>
    - remove <[object]>

custom_bject_handler_cleanup:
  type: world
  debug: false
  events:
    on server start:
      - flag server custom_objects.active:!