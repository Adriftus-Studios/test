custom_food_walnutbutter:
  type: item
  debug: false
  material: apple
  display name: <&a>Walnut Butter
  data:
    amount: 2
    saturation: 2
  lore:
  - <&e>Hunger: <&f>2 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>2 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 26
  recipes:
    1:
      type: shapeless
      input: cooking_tool_grinder|custom_crop_walnut