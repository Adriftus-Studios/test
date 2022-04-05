recipe_food_denier:
  type: world
  debug: false
  events:
    on custom_food_* recipe formed:
      - if !<player.discovered_recipes.filter[contains[denizen:]].contains[<context.recipe_id>]>:
        - determine cancelled

recipe_adder:
  type: world
  debug: false
  events:
    on player right clicks block with:recipe_book_*:
      - determine passively cancelled
      - if <player.flag[custom_food.recipe_books_read].contains[<context.item.script.name>].if_null[false]>:
        - playsound <player> sound:entity_villager_no volume:2
        - actionbar "<&4>You already know the recipes in this book"
        - stop
      - take iteminhand quantity:1
      - flag <player> custom_food.recipe_books_read:->:<context.item.script.name>
      - foreach <context.item.flag[recipes]> as:recipe:
        - adjust <player> discover_recipe:<item[custom_food_<[recipe]>].recipe_ids>
        - playsound sound:ITEM_BOOK_PAGE_TURN <player.location>
        - wait 30t
