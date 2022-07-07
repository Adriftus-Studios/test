custom_object_gravestone:
  type: data
  item: gravestone
  entity: gravestone_entity
  interaction: gravestone_use
  place_checks_task: gravestone_place
  after_place_task: gravestone_after_place
  remove_task: gravestone_remove
  barrier_locations:
    - <[location]>
    - <[location].above>


gravestone:
  type: item
  material: feather
  display name: <&7>Gravestone
  data:
    recipe_book_category: gadgets
  lore:
    - "<&e>Place in Town"
    - "<&a>Right Click When Placed"
    - "<&a>Returns Resident's Death Items"
    - "<&b>Cooldown<&co> <&f>15 Minutes"
  recipes:
    1:
      type: shaped
      input:
        - air|double_compressed_stone|air
        - double_compressed_stone|double_compressed_stone|double_compressed_stone
        - air|double_compressed_stone|air
  flags:
    right_click_script: custom_object_place
    custom_object: gravestone
  mechanisms:
    custom_model_data: 300

gravestone_entity:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    gravity: false
    is_small: true
    equipment:
      helmet: feather[custom_model_data=<list[300|301|302|303].random>]
  flags:
    right_click_script: gravestone_use
    on_entity_added: custom_object_update
    custom_object_type: gravestone


gravestone_place:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<context.location.has_town>:
      - narrate "<&c>Gravestones must be placed in a Town"
      - stop
    - if <context.location.town.mayor> != <player>:
      - narrate "<&c>Only Mayors can place Gravestones"
      - stop
    - if <context.location.town.has_flag[gravestones]> && <context.location.town.flag[gravestones].size> < <element[3].add[<context.location.town.plots.size.div[200].round_down>]>:
      - narrate "<&c>Too Many Gravestones, 3 + 1 Gravestone per 200 plots claimed"
      - stop

gravestone_after_place:
  type: task
  debug: false
  definitions: entity
  script:
    - define town <context.location.town>
    - flag <[entity]> town:<context.location.town>
    - flag <[town]> graves:->:<[entity]>
    - flag <[entity]> last_used:<util.time_now>
    - take iteminhand

gravestone_use:
  type: task
  debug: false
  definitions: entity
  script:
    - ratelimit <player> 1t
    - define entity <context.location.flag[custom_object]>
    - determine passively cancelled
    - if <player.is_sneaking> && <[entity].flag[town]> == <player.town> && <player.has_permission[towny.command.plot.asmayor]>:
      - run gravestone_remove def:<[entity]>
      - stop
    - if <player.has_town> && <[entity].flag[town]> != <player.town>:
      - narrate "<&c>You can only use your own Town's Gravestone"
      - stop
    - if !<player.has_flag[logged_inventories.death]>:
      - narrate "<&c>You have no saved deaths"
      - stop
    - if !<player.has_flag[graves.drops]>:
      - narrate "<&c>You have already claimed your most recent death"
      - stop
    - if <[entity].has_flag[last_used]> && <util.time_now.duration_since[<[entity].flag[last_used]>].in_minutes> < 15:
      - narrate "<&c>The Gravestone is still recharging"
      - narrate "<&c>Time Remaining<&co> <&e><duration[15m].sub[<util.time_now.duration_since[<[entity].flag[last_used]>]>].formatted>"
      - stop
    - give <player.flag[graves.drops]> to:<player.inventory>
    - flag player graves.drops:!
    - narrate "<&a>You have reclaimed your lost items."
    - flag <[entity]> last_used:<util.time_now>

gravestone_remove:
  type: task
  debug: false
  definitions: entity
  script:
    - define town <[entity].flag[town]>
    - flag <[town]> graves:<-:<[entity]>
    - run custom_object_remove def:<[entity]>

graves_player_death_handler:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:HIGHEST:
      - if <player.has_town> && <player.town.has_flag[graves]> && !<player.town.flag[graves].is_empty>:
        - flag <player> graves.drops:<context.drops>
        - determine NO_DROPS