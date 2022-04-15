custom_food_generaltsochicken:
  type: item
  debug: false
  material: apple
  display name: <&a>General Tso's Chicken
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 692
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|chicken|custom_crop_broccoli|sugar|custom_ingredient_flouritem|custom_crop_chilipepper|custom_crop_rice