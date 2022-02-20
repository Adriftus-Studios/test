gift_wrapping:
  type: item
  debug: false
  material: leather_horse_armor
  display name: <&a>G<&c>i<&a>f<&c>t <&a>W<&c>r<&a>a<&c>p<&a>p<&c>i<&a>n<&c>g
  lore:
  - "<&b>Right click on an item to wrap it"
  mechanisms:
    custom_model_data: 4
    color: 200,200,200
    hides: all

wrapped_gift:
  type: item
  debug: false
  material: leather_horse_armor
  display name: <&a>G<&c>i<&a>f<&c>t
  lore:
  - "<&b>I wonder what's inside?!"
  - "<&e>Right Click while holding"
  mechanisms:
    custom_model_data: 5
    hides: all

gift_wrapping_events:
  type: world
  debug: false
  events:
    on player right clicks item in PLAYER with:gift_wrapping:
      - stop if:<context.item.material.name.equals[air]>
      - stop if:<context.item.script.name.equals[gift_wrapping]||false>
      - adjust <player> item_on_cursor:wrapped_gift[flag=gift:<context.item>;color=<context.cursor_item.color>]
      - if <context.cursor_item.quantity> > 1:
        - determine <context.cursor_item.with[quantity=<context.cursor_item.quantity.sub[1]>]>
      - else:
        - determine air
    on player right clicks block with:wrapped_gift:
      - take iteminhand
      - define gift <context.item.flag[gift]>
      - give <[gift]>
      - if <[gift].quantity> > 1:
        - narrate "<&6>Your gift contained <&e><[gift].quantity> <[gift].display||<[gift].formatted>><&6>!!"
      - else:
        - narrate "<&6>Your gift contained <&e><[gift].display||<[gift].formatted>><&6>!!"
