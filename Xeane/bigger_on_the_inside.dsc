bigger_on_the_inside_start:
  type: task
  debug: false
  script:
    - if !<player.has_flag[boti.current]>:
      - define info <context.location.flag[show_fake_info]>
      - define schematic_name <[info].get[schematic]>
      - define ID <[info].get[ID]>
      - define paste_origin <[info].get[location]>
      - define blocks <schematic[<[schematic_name]>].cuboid[<[paste_origin]>].blocks>
      - schematic paste name:<[schematic_name]> fake_to:<player> fake_duration:999h <[paste_origin]>
      - flag <player> boti.current.blocks:<[blocks]>
      - flag <player> boti.current.id:<[id]>
      - adjust <player> noclip:true
      - adjust <player> hide_from_players
      - if <player.has_flag[boti.saved.<[id]>]>:
        - foreach <player.flag[boti.saved.<[id]>]> key:loc as:block:
          - showfake <[loc]> <[block]> duration:999h
          - if <[loop_index].mod[10]> == 0:
            - wait 1t

bigger_on_the_inside_stop:
  type: task
  debug: false
  script:
    - if <player.has_flag[boti.current]>:
      - showfake <player.flag[boti.current.blocks]> cancel players:<player>
      - flag <player> boti:!
      - adjust <player> noclip:false
      - adjust <player> show_to_players

bigger_on_the_inside_events:
  type: world
  debug: false
  events:
    on player places block flagged:boti.current:
      - determine passively cancelled
      - flag <player> boti.saved.<player.flag[boti.current.id]>.<context.location>:<context.material>
      - wait 1t
      - showfake <context.material> player:<player> <context.location> duration:99h
      - take iteminhand
      - narrate "Saved <context.material> at <context.location> for <player.flag[boti.current.id]>"
    on player breaks block flagged:boti.current:
      - narrate <context.material>
      #- flag <player> boti.saved.<player.flag[boti.current.id]>.<context.location>:!