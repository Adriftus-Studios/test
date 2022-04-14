custom_food_scallionbakedpotato:
  type: item
  debug: false
  material: apple
  display name: <&a>Scallion Baked Potato
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1120
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|baked_potato|custom_crop_scallion|custom_ingredient_creamitem