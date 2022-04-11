easter_candy_chocolate_bunny:
  Type: item
  Debug: false
  Material: cookie
  Mechanisms:
    Custom_model_data: 69420
  Display name: <&d>Chocolate Bunny
  Lore:
  - <&f>Hey, who bit the ear?
  - <&6>Lets you <&e>jump higher<&6> in <&e>hub<&6>.

Easter_candy_creme_egg
  Type: item
  Debug: false
  Material: cookie
  Mechanisms:
    Custom_model_data: 69420
  Display name: <&d>Creme Egg
  Lore:
  - <&f>So sweet it hurts your teeth!
  - <&6>Gives you a <&e>speed boost<&6> in <&e>hub<&6>.

Easter_bunny_mask_token
  Type: item
  Debug: false
  Material: player_head
  Display name: <&d>Easter Bunny Mask
  Mechanisms:
    Skull_skin: fillthisin
  Lore:
  - The Visage of the bunny himself.

Easter_bunny_mask_event
  Type: world
  Debug: false
  Events:
    On player right clicks block with:easter_bunny_mask_token:
    - determine passively cancelled
    - if <player.has_flag[easter.mask.bunny_unlocked]>:
      - narrate "<&4>You have already unlocked this mask."
    - take iteminhand
    - run mask_unlock def:easter_bunny
    - narrate <&d>Easter Bunny <&e>added to your <&6>cosmetics<&e> menu+
    - flag <player> easter.mask.bunny_unlocked

Easter_candy_chocolate_bunny_event:
  Type: world
  Debug: false
  Events:
    On player consumes easter_candy_chocolate_bunny:
    - flag <player> hub_jump expiration:1200

Easter_candy_creme_egg_event:
  Type: world
  Debug: false
  Events:
    On player consumes easter_candy_creme_egg:
    - flag <player> hub_run expiration:1200
