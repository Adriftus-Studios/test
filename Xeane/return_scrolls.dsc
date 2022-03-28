return_scroll:
  type: item
  material: paper
  display name: <&6>Scroll of Returning
  lore:
  - "<&a>-------------"
  - "<&e>Right Click while Holding"
  - "<&e>Saves location when crafted"
  - "<&a>-------------"
  - "<&b>Location<&co> <&e><player.location.simple.if_null[<&a>Spawn]>"
  recipes:
    1:
      type: shapeless
      input: ink_sac|paper
  flags:
    right_click_script: return_scroll_task
    return_scroll_location: <player.location.if_null[spawn]>

return_scroll_task:
  type: task
  debug: false
  script:
    - take iteminhand
    - run teleportation_animation_run def:<context.item.flag[return_scroll_location]>