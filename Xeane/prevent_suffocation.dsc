prevent_suffocation_handler:
  type: world
  debug: false
  events:
    on player damaged by SUFFOCATION:
      - determine cancelled if:<player.fake_block[<player.location.above.block>].name.equals[air]>