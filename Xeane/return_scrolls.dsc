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
      input: ink_sac|ink_sac|paper

return_scroll_events:
  type: world
  debug: false
  events:
    on player crafts return_scroll:
      - define lore "<context.item.lore.include[<&b>Location<&co> <player.location.simple>]>"
      - determine <item[return_scroll].with[flag=destination:<player.location>;flag=right_click_script=return_scroll_task;lore=<[lore]>]>

return_scroll_task:
  type: task
  debug: false
  script:
    - take iteminhand
    - run teleportation_animation_run def:<context.item.flag[destination]>