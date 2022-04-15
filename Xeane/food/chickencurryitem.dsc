custom_food_chickencurry:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Curry
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>23<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 509
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_coconut|custom_food_yogurt|chicken|custom_ingredient_currypowderitem|custom_crop_chilipepper|custom_crop_rice