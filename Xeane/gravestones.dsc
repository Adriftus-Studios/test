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
    right_click_script: gravestone_place
  mechanisms:
    custom_model_data: 300

gravestone_entity:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    gravity: false
    equipment:
      helmet: feather[custom_model_data=<list[300|301|302|303].random>]
  flags:
    right_click_script: gravestone_use
    on_entity_added: gravestone_active


gravestone_active:
  type: task
  debug: false
  definitions: entity
  script:
    - define entity <context.entity> if:<[entity].exists.not>
    - while <[entity].is_spawned>:
      - foreach <[entity].location.find_players_within[30]>:
        - if <[value].fake_block[<[entity].location>].exists>:
          - foreach next
        - showfake <[entity].location> air duration:9999m players:<[value]>
        - showfake <[entity].location.above> air duration:9999m players:<[value]>
      - wait 5s

gravestone_place:
  type: task
  debug: false
  script:
    - if !<context.location.has_town>:
      - narrate "<&c>Gravestones must be placed in a Town"
      - stop
    - if <context.location.town.mayor> != <player>:
      - narrate "<&c>Only Mayors can place Gravestones"
      - stop
    - if <context.location.town.has_flag[gravestones]> && <context.location.town.flag[gravestones].size> < <element[3].add[<context.location.town.plots.size.div[200].round_down>]>:
      - narrate "<&c>Too Many Gravestones, 3 + 1 Gravestone per 200 plots claimed"
      - stop
    - spawn gravestone_entity <context.location.above.center.below[0.49]> save:grave
    - if !<entry[grave].spawned_entity.is_spawned>:
      - narrate "<&c>ERROR - Report Me - Error Code<&co> GraveNotSpawning"
      - stop
    - define town <context.location.town>
    - define barrier_blocks <list[<entry[grave].spawned_entity.location>|<entry[grave].spawned_entity.location.above>]>
    - modifyblock <[barrier_blocks]> barrier
    - flag <entry[grave].spawned_entity> grave.blocks:|:<[barrier_blocks]>
    - flag <entry[grave].spawned_entity> town:<context.location.town>
    - flag <[town]> graves:->:<entry[grave].spawned_entity>
    - showfake <[barrier_blocks]> air duration:9999m players:<context.location.find_players_within[30]>
    - take iteminhand
    - run gravestone_active def:<entry[grave].spawned_entity>

gravestone_use:
  type: task
  debug: false
  script:
    - if <player.is_sneaking> && <context.entity.flag[town].mayor> == <player>:
      - run gravestone_remove def:<context.entity>
      - stop
    - if <player.has_town> && <context.entity.flag[town]> != <player.town>:
      - narrate "<&c>You can only use your own Town's Gravestone"
      - stop
    - if !<player.has_flag[logged_inventories.death]>:
      - narrate "<&c>You have no saved deaths"
      - stop
    - if <player.has_flag[gravestones.last_claimed_uuid]> && <player.flag[gravestones.last_claimed_uuid]> == <player.flag[logged_inventories.death].last.get[uuid]>:
      - narrate "<&c>You have already claimed your most recent death"
      - stop
    - if <context.entity.has_flag[last_used]> && <util.time_now.duration_since[<context.entity.flag[last_used]>].in_minutes> < 15:
      - narrate "<&c>The Gravestone is still recharging"
      - narrate "<&c>Time Remaining<&co> <&e><duration[15m].sub[<util.time_now.duration_since[<context.entity.flag[last_used]>]>].formatted>"
      - stop
    - give <player.flag[logged_inventories.death].last.get[inventory].values> to:<player.inventory>
    - flag player gravestones.last_claimed_uuid:<player.flag[logged_inventories.death].last.get[uuid]>
    - narrate "<&a>You have reclaimed your lost items."
    - flag <context.entity> last_used:<util.time_now>

gravestone_remove:
  type: task
  debug: false
  definitions: entity
  script:
    - define town <[entity].flag[town]>
    - modifyblock <[entity].flag[grave.blocks]> air
    - showfake cancel <[entity].flag[grave.blocks]>
    - flag <[town]> graves:<-:<[entity]>
    - remove <[entity]>
    - give gravestone to:<player.inventory>