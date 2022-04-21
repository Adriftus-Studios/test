santa_hat:
  type: item
  debug: false
  material: clock
  display name: <&6>Santa Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  mechanisms:
    custom_model_data: 3
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_hat_canceller_santa_hat:
  type: world
  debug: false
  events:
    on player right clicks block with:santa_hat:
      - determine passively cancelled
