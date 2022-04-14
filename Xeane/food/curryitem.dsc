custom_food_curry:
  type: item
  debug: false
  material: apple
  display name: <&a>Curry
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>19 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 593
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_rice|custom_ingredient_blackpepperitem|custom_crop_chilipepper|custom_crop_coconut|custom_ingredient_currypowderitem|cooking_tool_grinder|cooking_tool_grinder|cooking_tool_grinder