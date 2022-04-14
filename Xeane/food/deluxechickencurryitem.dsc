custom_food_deluxechickencurry:
  type: item
  debug: false
  material: apple
  display name: <&a>Deluxe Chicken Curry
  data:
    amount: 39
    saturation: 47
  lore:
  - <&e>Hunger: <&f>39<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>47<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 607
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_chickencurry|custom_crop_rice|custom_food_naan|custom_food_mangochutney