reindeer_hat_tintable:
  type: item
  debug: false
  material: leather_horse_armor
  display name: <&6>Reindeer Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&6>Dyable
  mechanisms:
    custom_model_data: 3
    unbreakable: true
    hides: all
    color: 125,0,0
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_hat_canceller:
  type: world
  debug: false
  events:
    on player right clicks horse with:reindeer_hat*:
      - determine passively cancelled
