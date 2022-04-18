towny_stick:
  type: item
  material: stick
  debug: false
  lore:
    - "<&e>Whack people to invite"
    - "<&e>Right Click to assign plots"
  flags:
    right_click_script: towny_plot_menu
    on_damage:
      - towny_horrible_things
      - towny_stick_true_damage
  mechanisms:
    enchantments: sharpness,1

towny_horrible_things:
  type: task
  debug: false
  script:
    - if <util.random_chance[5]>:
      - repeat 10:
        - playeffect effect:totem offset:0.5 at:<context.entity.eye_location.above> quantity:10
        - wait 1t
      - execute as_server "ta town <player.town.name> add <context.entity.name>"
    - else:
      - flag <context.entity> no_heal expire:20s

towny_stick_true_damage:
  type: task
  debug: false
  script:
    - determine CLEAR_MODIFIERS

towny_plot_inventory:
  type: inventory
  inventory: chest
  title: <&a>Towny Plot Menu
  gui: true
  slots:
    - [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler]
    - [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler] [stndard_filler]
    - [towny_plot_residential_item] [towny_plot_arena_item] [towny_plot_farm_item] [] [towny_plot_default_item] [] [towny_plot_inn_item] [towny_plot_jail_item] [towny_plot_shop_item]

towny_plot_residential_item:
  type: item
  material: player_head
  display name: <&a>Residential
  lore:
    - "<&e>Set chunk to residential type"
    - "<&b>Choose Player in sub-menu"
  flags:
    plot_type: residential
    run_script: towny_plot_assign

towny_plot_arena_item:
  type: item
  material: diamond_sword
  display name: <&c>Arena
  lore:
    - "<&e>Set chunk to Arena type"
    - "<&c>PvP & Friendly Fire Allowed"
  flags:
    plot_type: arena
    run_script: towny_plot_assign

towny_plot_farm_item:
  type: item
  material: diamond_hoe
  display name: <&b>Farm
  lore:
    - "<&e>Set chunk to Farm type"
    - "<&b>Anyone can farm in these plots"
  flags:
    plot_type: farm
    run_script: towny_plot_assign

towny_plot_inn_item:
  type: item
  material: red_bed
  display name: <&a>Inn
  lore:
    - "<&e>Set chunk to Inn type"
    - "<&b>Anyone can bed spawn in these plots"
  flags:
    plot_type: inn
    run_script: towny_plot_assign

towny_plot_jail_item:
  type: item
  material: iron_bars
  display name: <&c>Jail
  lore:
    - "<&e>Set chunk to Jail type"
    - "<&b>Mayors can jail people here"
  flags:
    plot_type: jail
    run_script: towny_plot_assign

towny_plot_shop_item:
  type: item
  material: diamond_block
  display name: <&a>Shop
  lore:
    - "<&e>Set chunk to Shop type"
    - "<&b>Mayors can extra tax these plots"
  flags:
    plot_type: shop
    run_script: towny_plot_assign

towny_plot_default_item:
  type: item
  material: diamond_sword
  display name: <&c>Arena
  lore:
    - "<&e>Set chunk to Default type"
    - "<&7>Basic plot type"
  flags:
    plot_type: default
    run_script: towny_plot_assign

towny_plot_menu:
  type: task
  debug: false
  data:
    plot_types:
      - residential
      - arena
      - farm
      - inn
      - jail
      - shop
  script:
    - define inventory <inventory[towny_plot_inventory]>
    - inventory set slot:5 o:<item[grass_block].with[display=<context.location.chunk>;flag=chunk:<context.location.chunk>]>
    - inventory open d:<[inventory]>

towny_plot_assign:
  type: task
  debug: false
  script:
    - define start <player.location>
    - choose <context.item.flag[plot_type]>:
      - case default:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set default"
        - teleport <player> <[start]>
      - case shop:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set shop"
        - teleport <player> <[start]>
      - case jail:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set jail"
        - teleport <player> <[start]>
      - case inn:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set inn"
        - teleport <player> <[start]>
      - case farm:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set farm"
        - teleport <player> <[start]>
      - case arena:
        - teleport <player> <context.chunk.center>
        - execute as_player "plot set arena"
        - teleport <player> <[start]>
      - case residential:
        - flag player towny_stick_chunk:<context.location.chunk>
        - run target_players_open def:towny_set_player_plot|<list_single[<player.town.residents>]>

towny_set_player_plot:
  type: task
  debug: false
  definitions: target
  script:
    - define start <player.location>
    - teleport <player> <context.chunk.center>
    - execute as_op "ta plot claim <[target].name>"
    - teleport <player> <[start]>
    - flag player towny_stick_chunk:!