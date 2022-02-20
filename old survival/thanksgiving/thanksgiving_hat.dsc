thanksgiving_hat:
  type: item
  debug: false
  material: clock
  display name: <&6>Old Fashioned Cap
  lore:
  - <&e>A reward from the 2021 Adriftus Thanksgiving Event.
  - <&e>Thank you for taking the time to celebrate with us.
  mechanisms:
    custom_model_data: 1
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

thanksgiving_hat_canceller:
  type: world
  debug: true
  events:
    on player right clicks block with:thanksgiving_hat:
      - determine passively cancelled
