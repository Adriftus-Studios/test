test_dungeon_elevator_events:
  type: world
  debug: false
  events:
    on player enters area:
    - narrate <context.area>
    - narrate <context.area.flag[elevator.destination]>
    - narrate <context.area.flag[elevator.destination].as_location>
    - narrate <context.area.flag[elevator.destination].as_location.is_truthy>
    - narrate <context.area.flag[elevator.destination].as_location.is_truthy.not>
    - stop if:<context.area.flag[elevator.destination].as_location.is_truthy.not.if_null[true]>
    - define waitbefore 5t
    - define waitmiddle 10t
    - define waitafter 5t
    - title title:<&color[#000000]><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:<[waitbefore]> stay:<[waitmiddle]> fade_out:<[waitafter]>
    - wait <[waitbefore]>
    - wait <[waitmiddle].div[2]>
    - teleport <context.area.flag[elevator.destination]>
    - wait <[waitmiddle].div[2]>
    - wait <[waitafter]>