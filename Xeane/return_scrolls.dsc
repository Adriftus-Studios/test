return_scroll:
  type: item
  material: paper
  display name: <&6>Scroll of Returning
  lore:
  - "<&a>-------------"
  - "<&e>Right Click while Holding"
  - "<&e>Saves location when crafted"
  - "<&a>-------------"
  recipes:
    1:
      type: shapeless
      input: ink_sac|paper

return_scroll_events:
  type: world
  debug: false
  events:
    on player crafts return_scroll:
      - define lore "<context.item.lore.include[<&b>Location<&co> <player.location.simple>]>"
      - if <context.amount> == 1:
        - determine passively <item[return_scroll].with[flag=destination:<player.location>;flag=right_click_script:return_scroll_task;lore=<[lore]>]>
      - else:
        - determine passively cancelled
        - wait 1t
        - foreach <server.recipe_items[<context.recipe_id>]>:
          - if <[value].starts_with[material<&co>]>:
            - define item <[value].substring[9]>
          - else:
            - define item <[value]>
          - take item:<[item]> from:<context.inventory>
        - give <item[return_scroll].with[quantity=<context.amount>;flag=destination:<player.location>;flag=right_click_script:return_scroll_task;lore=<[lore]>]>

return_scroll_task:
  type: task
  debug: false
  script:
    - take iteminhand
    - run teleportation_animation_run def:<context.item.flag[destination]>