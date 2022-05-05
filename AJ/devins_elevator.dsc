test_dungeon_elevator_events:
  type: world
  debug: true
  events:
    on player enters area:
    - narrate test
    - stop if:<context.area.flag[elevator.destination].as_location.is_truthy.not.if_null[true]>
    - title title:<&color[#000000]><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:5t stay:10t fade_out:5t
    - wait 10t
    - teleport <context.area.flag[elevator.destination]>
    - wait 10t