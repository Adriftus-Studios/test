bigger_on_the_inside_start:
  type: task
  debug: false
  script:
    - if !<player.has_flag[boti_blocks]>:
      - define info <context.location.flag[show_fake_info]>
      - define schematic_name <[info].get[schematic]>
      - define paste_origin <[info].get[location]>
      - define blocks <schematic[<[schematic_name]>].cuboid[<[paste_origin]>].blocks>
      - schematic paste name:<[schematic_name]> fake_to:<player> fake_duration:999h <[paste_origin]>
      - flag <player> boti_blocks:<[blocks]>

bigger_on_the_inside_stop:
  type: task
  debug: false
  script:
    - if <player.has_flag[boti_blocks]>:
      - showfake <player.flag[boti_blocks]> cancel players:<player>
      - flag <player> boti_blocks:!