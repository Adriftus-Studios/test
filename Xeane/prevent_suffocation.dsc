prevent_suffocation_handler:
  type: world
  debug: false
  events:
    on player damaged by SUFFOCATION bukkit_priority:HIGHEST:
      - stop if:<player.fake_block[<player.location.above.block>].name.equals[air].not>
      - determine passively cancelled
      - flag player no_suffocate expire:2s