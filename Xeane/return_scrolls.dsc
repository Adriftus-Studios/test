return_scroll:
  type: item
  material: feather
  display name: <&6>Scroll of Returning
  data:
    recipe_book_category: travel
  lore:
  - "<&a>-------------"
  - "<&e>Right Click while Holding"
  - "<&e>Saves location when crafted"
  - "<&a>-------------"
  flags:
    right_click_script: return_task
    type: scroll
  mechanisms:
    custom_model_data: 200
  recipes:
    1:
      type: shapeless
      input: ink_sac|paper

return_crystal:
  type: item
  material: feather
  display name: <&6>Return Crystal
  data:
    recipe_book_category: travel
  lore:
  - "<&a>-------------"
  - "<&e>Right Click while Holding"
  - "<&e>Saves location when crafted"
  - "<&a>-------------"
  flags:
    right_click_script: return_task
    type: crystal
  mechanisms:
    custom_model_data: 200
  #recipes:
    #1:
      #type: shapeless
      #input: ink_sac|paper

return_events:
  type: world
  debug: false
  events:
    on return_scroll|return_crystal recipe formed:
      - define lore "<context.item.lore.include[<&b>Location<&co> <player.location.simple>]>"
      - determine passively <item[return_scroll].with[flag=destination:<player.location>;lore=<[lore]>]>

return_task:
  type: task
  debug: false
  script:
    - define type <context.item.flag[type]>
    - if <[type]> == scroll && <context.item.flag[destination]> != <player.location.world>:
      - narrate "<&c>This item lacks the power for cross dimensional travel"
      - stop
    - take iteminhand
    - run teleportation_animation_run def:<context.item.flag[destination]>