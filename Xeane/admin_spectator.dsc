admin_mode_spectator:
  type: command
  name: amsp
  usage: /amsp
  description: spectator mode, with particles!
  permission: adriftus.admin
  script:
    - adjust <player>
    - inject admin_mode_spectator_loop

admin_mode_spectator_loop:
  type: task
  debug: false
  script:
    - while <player.is_online> && <player.gamemode> == SPECTATOR:
      - playeffect at:<player.location> quantity:20 effect:REDSTONE offset:0.5 special_data:5|black
      - wait 2t