zanzabar_events:
  type: world
  debug: false
  events:
    on player exits zanzabar:
    - determine passively cancelled
    - if <player.location.y> < 61:
      - teleport <player.world.spawn_location>
