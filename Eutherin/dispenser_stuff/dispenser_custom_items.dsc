dispenser_custom_handling:
  type: world
  debug: false
  events:
    on block dispenses item:
      - if <context.item.has_flag[custom_dispense]>:
        - determine passively cancelled
        - inject custom_dispense_inventory_process

custom_dispense_inventory_process:
  type: task
  debug: false
  script:
    - define inventory_contents <context.location.inventory.list_contents>
    - wait 5t
    - foreach <[inventory_contents]> as:item:
      - if !<[item].has_flag[custom_dispense]>:
        - foreach next
      - else if <[item].flag[custom_dispense]> == note:
        - define instrument <[item].flag[instrument]>
        - define pitch <[item].flag[pitch]>
        - playsound sound:block_note_block_<[instrument]> pitch:<[pitch]> <context.location>
        - wait 5t
      - else if <[item].flag[custom_dispense]> == pause:
        - wait <[item].flag[pause_duration]>t
      - else if <[item].flag[custom_dispense]> == visual:
        - define particle <[item].flag[particle]>
        - define color <[item].flag[color]>
        - playeffect <[particle]> color:<[color]> <context.location>
