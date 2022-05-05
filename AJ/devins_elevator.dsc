test_dungeon_elevator_events:
  type: world
  debug: true
  events:
    on player enters area_flagged:elevator.destination:
    - title title:<&color[#000000]><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:5t stay:10t fade_out:5t
    - wait 10t
    - teleport <context.area.flag[elevator.destination]>
    - wait 10t