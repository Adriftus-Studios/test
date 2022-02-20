elf_hat_tintable:
  type: item
  debug: false
  material: leather_horse_armor
  display name: <&6>Elf Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&6>Dyable
  mechanisms:
    custom_model_data: 2
    unbreakable: true
    hides: all
    color: 25,250,25
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

christmas_hat_canceller:
  type: world
  debug: false
  events:
    on player right clicks block with:elf_hat_*:
      - determine passively cancelled
    on player right clicks horse with:elf_hat_*:
      - determine passively cancelled
elf_hat_Blue:
  type: item
  debug: false
  material: clock
  display name: <&6>Elf Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  mechanisms:
    custom_model_data: 6
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

elf_hat_green:
  type: item
  debug: false
  material: clock
  display name: <&6>Elf Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  mechanisms:
    custom_model_data: 4
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>

elf_hat_purple:
  type: item
  debug: false
  material: clock
  display name: <&6>Elf Hat
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Event.
  - <&e>Thank you for taking the time to celebrate with us.
  mechanisms:
    custom_model_data: 5
    unbreakable: true
    hides: all
  flags:
    no_custom_enchants: 1
    hat: <server.current_time_millis>
