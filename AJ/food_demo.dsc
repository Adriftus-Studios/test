
flour_item:
  type: item
  material: sugar
  display name: <&7>Flour
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      recipe_id: flour_recipe_1
      input: wheat

flour_item_craft_events:
  type: world
  debug: false
  events:
    after player clicks in inventory:
    - stop if:<context.inventory.map_slots.values.parse[material.name].contains[wheat]>

dough_item_craft_events:
  type: world
  debug: false
  events:
    on player right clicks block:
    - stop if:<context.item.script.name.equals[flour_item].not.if_null[true]>
    - stop if:<context.location.material.name.ends_with[cauldron].not.if_null[true]>
    - stop if:<context.location.material.level.equals[0].if_null[true]>
    - take from:<player.inventory> item:flour_item quantity:1
    - drop <context.location.above[1].center.below[0.5]> <item[dough_item]> quantity:1
    - if <context.location.material.level> > 1:
      - adjustblock <context.location> level:<context.location.material.level.sub[1]>
    - else:
      - modifyblock <context.location> cauldron

dough_item:
  type: item
  material: clay_ball
  display name: <&7>Dough

dough_press_item:
  type: item
  material: lodestone
  display name: <&e>Dough Press

dough_press_item_events:
  type: world
  debug: false
  events:
    after player crafts item:
    - stop if:<context.is_cancelled>
    - stop if:<context.recipe_id.starts_with[denizen:tortilla_recipe].not.if_null[true]>
    - define slot <context.inventory.find_item[dough_press_item]>
    - define item <context.inventory.slot[<[slot]>]>
    - wait 1t
    - inventory set d:<context.inventory> slot:<[slot]> o:<[item]>

tortilla_item:
  type: item
  material: bread
  display name: Tortilla
  recipes:
    1:
      recipe_id: tortilla_recipe_1
      output_quantity: 1
      type: shapeless
      input: dough_item|dough_press_item

ground_beef_item:
  type: item
  material: beef
  display name: <&7>Ground Beef

ground_beef_item_events:
  type: world
  debug: false
  events:
    on player prepares anvil craft item:
    - stop if:<context.inventory.slot[1].material.name.equals[beef].not.if_null[true]>
    - stop if:<context.inventory.slot[2].material.name.equals[iron_sword].not.if_null[true]>
    - determine <item[ground_beef_item].with[quantity=<context.inventory.slot[1].quantity>]>

cooked_ground_beef_item:
  type: item
  material: cooked_beef
  display name: <&7>Cooked Ground Beef
  recipes:
    1:
      recipe_id: cooked_ground_beed_recipe_1
      output_quantity: 1
      type: smoker
      cook_time: 5s
      experience: 2
      input: ground_beef_item

taco_item:
  type: item
  material: bread
  display name: <&e>Taco
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      recipe_id: taco_recipe_1
      input: cooked_ground_beef_item|tortilla_item