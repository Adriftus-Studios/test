custom_food_pistachiobutter:
  type: item
  debug: false
  material: apple
  display name: <&a>Pistachio Butter
  data:
    amount: 2
    saturation: 2
  lore:
  - <&e>Hunger: <&f>2<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>2<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 25
  recipes:
    1:
      type: shapeless
      input: cooking_tool_grinder|custom_crop_pistachio