block_properties:
  type: world
  debug: true
  events:
    on player places block location_flagged:no_build:
      - determine cancelled
    on player breaks block location_flagged:on_break:
      - inject <context.location.flag[on_break]>