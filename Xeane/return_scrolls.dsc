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
      - if <context.amount> > 1:
        - determine passively cancelled
      - define lore "<context.item.lore.include[<&b>Location<&co> <player.location.simple>]>"
      - foreach <server.recipe_items[<context.recipe_id>]>:
        - if <[value].starts_with[material<&co>]>:
          - define item <[value].substring[9]>
        - else:
          - define item <[value]>
        - take item:<[item]> from:<context.inventory>
      - determine <item[return_scroll].with[quantity=<context.amount>;flag=destination:<player.location>;flag=right_click_script:return_scroll_task;lore=<[lore]>]>

return_scroll_task:
  type: task
  debug: false
  script:
    - take iteminhand
    - run teleportation_animation_run def:<context.item.flag[destination]>