custom_food_crispyricepuffbars:
  type: item
  debug: false
  material: apple
  display name: <&a>Crisp Rice Puff Bars
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 589
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_marshmellows|custom_crop_rice