christmas_socks_red_leaping:
  type: item
  debug: false
  material: leather_boots
  display name: <&6>Lord's Leaping Socks
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&a>Put some pep in your step!
  - <&f>
  - <&6>Uses<&co> <&e>25
  mechanisms:
    custom_model_data: 2
    hides: all
    unbreakable: true
  flags:
    no_custom_enchants: 1
    uses: 25

christmas_socks_red_threadbare:
  type: item
  debug: false
  material: leather_boots
  display name: <&6>Lord's Threadbare Socks
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&a>They're worn thin, but still stylish!
  - <&f>
  mechanisms:
    custom_model_data: 2
    hides: all
    unbreakable: true
  flags:
    no_custom_enchants: 1
    uses: 25

leaping_socks_handler:
  type: world
  debug: false
  events:
    on player jumps:
      - ratelimit <player> 2s
      - if <player.inventory.slot[37].script.name||null> == christmas_socks_red_leaping:
        - shoot <player> height:0.5 origin:<player>
        - playsound sound:ENTITY_PLAYER_SMALL_FALL <player.location>
        - if <player.inventory.slot[37].flag[uses]> == 1:
          - equip boots:christmas_socks_red_threadbare
          - stop
        - inventory flag slot:37 uses:<player.inventory.slot[37].flag[uses].sub[1]>
        - inventory adjust slot:37 "lore:<&e>A reward from the 2021 Adriftus Christmas Advent.|<&e>Thank you for taking the time to celebrate with us.|<&a>Put some pep in your step!|<&e>|<&6>Uses<&co> <&e><player.inventory.slot[37].flag[uses]>"
