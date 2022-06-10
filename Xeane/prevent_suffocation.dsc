prevent_suffocation_handler:
  type: world
  debug: false
  events:
    on player damaged by SUFFOCATION bukkit_priority:HIGHEST:
      - determine passively cancelled if:<player.fake_block[<player.location.above.block>].name.equals[air]>
      - flag player no_suffocate expire:2s