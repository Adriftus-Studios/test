custom_object_town_defence:
  type: data
  item: town_defence_item
  entity: town_defence
  interaction: town_defence_use
  place_checks_task: town_defence_checks
  after_place_task: town_defence_after_place
  remove_task: town_defence_remove
  barrier_locations:
    - <[location]>
    - <[location].above>

town_defence:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    custom_name: Sentinel Tower
    custom_name_visible: true

town_defence_item:
  type: item
  debug: false
  material: feather
  display name: <&c>Town Defence
  lore:
  - <&e><&l>Stationary Turret
  - <&c>Attacks Outlaws on Sight
  flags:
    right_click_script: custom_object_place
    custom_object: town_defence

town_defence_watch:
  type: world
  debug: false
  events:
    on player enters town:
      - if <context.town.outlaws.contains[<player>]>:
        - run town_defence_add_target def:<context.town>|<player>
    on player exits town:
      - if <context.town.has_flag[active_outlaws]> && <context.town.flag[active_outlaws].contains[<player>]>:
        - flag <context.town> active_outlaws:<-:<player>
        - if <context.town.flag[active_outlaws].is_empty>:
          - flag <context.town> active_outlaws:!
    after server start:
      - foreach <towny.list_towns>:
        - flag <[value]> active_outlaws:!

town_defence_add_target:
  type: task
  debug: false
  definitions: town|target
  script:
    - stop if:<[town].has_flag[town_defences].not>
    - flag town active_outlaws:->:<[target]>
    - if <[town].flag[active_outlaws].size> == 1:
      - run town_defence_loop def:<[town]>

town_defence_checks:
  type: task
  debug: false
  definitions: entity
  script:
    - if !<[location].town.exists> || <[location].town> != <player.town> || !<player.has_permission[towny.command.plot.asmayor]>:
      - narrate "<&c>You do not have permission to place this here."
      - stop

town_defence_after_place:
  type: task
  debug: false
  definitions: entity
  script:
    - flag <[location].town> active_defences:->:<[entity]>

town_defence_remove:
  type: task
  debug: false
  script:
    - define entity <context.location.flag[custom_object]>
    - flag <[entity].location.town> active_defences:<-:<[entity]>
    - if <[entity].location.town.flag[active_defences].is_empty>:
      - flag <[entity].location.town> active_defences:!
    - run custom_object_remove defL<[entity]>


town_defence_loop:
  type: task
  debug: false
  definitions: town
  script:
    - while <[town].has_flag[active_outlaws]> && <[town].has_flag[town_defences]>:
      - foreach <[town].flag[active_outlaws]> as:outlaw:
        - foreach <[town].flag[town_defences].filter[can_see[<[outlaw]>]]> as:defence:
          - run town_defence_attack def:<[defence]>|<[outlaw]>
          - wait 2t
        - wait 1t
      - wait 1t
    - wait 1t
    - run town_defence_loop def:<[town]>

town_defence_attack:
  type: task
  debug: false
  definitions: entity|target
  script:
    - playeffect at:<[entity].eye_location.points_between[<[target].location.above>].distance[0.5]> effect:dragon_breath quantity:5 offset:0.1 targets:<[target].location.find_players_within[120]>
    - flag <[target]> custom_damage.cause:<[entity].custom_name>
    - hurt <[target]> 6 cause:CUSTOM

town_defence_use:
  type: task
  debug: false
  script:
    - if <player.is_sneaking> && <player.has_permission[towny.command.plot.asmayor]>:
      - run town_defence_remove def:<context.location.flag[entity]>