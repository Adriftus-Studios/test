custom_gathering_handler:
  type: world
  debug: false
  events:
    on player breaks grass bukkit_priority:HIGH:
    - if <util.random.int[1].to[100]> <= 10:
      - define type <list[onion|rice].random>
      - drop custom_seed_<[type]> <context.location>

custom_seed_planting_handler:
  type: world
  debug: false
  events:
    on player right clicks farmland with:custom_seed_* bukkit_priority:HIGHEST:
    - define crop_location <context.location.add[0,1,0]>
    - if <[crop_location].material.name> != air || <[crop_location].material.age||0> > 0 || <[crop_location].has_flag[custom_planted]>:
      - stop
    - flag <[crop_location]> custom_planted:<context.item.script.name.after[custom_seed_]>


custom_crop_harvesting_hander:
  type: world
  debug: false
  events:
    on player breaks beetroots|wheat bukkit_priority:HIGHEST:
    - if !<context.location.has_flag[custom_planted]>:
      - stop
    - define type <context.location.flag[custom_planted]>
    - if <context.location.material.age||0> == <context.location.material.maximum_age||99>:
      - define crop_quantity <script[custom_seed_<[type]>].data_key[data.max_crops]>
      - define seed_quantity <script[custom_seed_<[type]>].data_key[data.max_seeds]>
      - flag <context.location> custom_planted:!
      - determine custom_crop_<[type]>[quantity=<util.random.int[1].to[<[crop_quantity]>]>]|custom_seed_<[type]>[quantity=<util.random.int[1].to[<[seed_quantity]>]>]
    - flag <context.location> custom_planted:!
    - determine custom_seed_<[type]>[quantity=1]
