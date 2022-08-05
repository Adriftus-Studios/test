recipe_announcer:
  type: world
  debug: false
  events:
    on item recipe formed flagged:recipe_debug:
      - narrate "Inventory<&co> <context.inventory>"
      - narrate "Item<&co> <context.item>"
      - narrate "Inventory<&co> <context.inventory>"
      - narrate "Recipe<&co> <context.recipe>"
      - narrate "RecipeID<&co> <context.recipe_id>"