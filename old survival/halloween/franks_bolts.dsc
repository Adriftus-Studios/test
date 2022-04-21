franks_bolts:
  type: item
  debug: false
  material: clock
  display name: <&6>Franks Bolts
  lore:
  - <&e>Simply Electrifying
  mechanisms:
    custom_model_data: 7
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_hat_canceller_franks_bolts:
  type: world
  debug: false
  events:
    on player right clicks block with:santa_hat:
      - determine passively cancelled
