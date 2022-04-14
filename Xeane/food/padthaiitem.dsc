custom_food_padthai:
  type: item
  debug: false
  material: apple
  display name: <&a>Pad Thai
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>19<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 947
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_pastaitem|custom_crop_peanut|custom_food_boiledegg|custom_food_firmtofu|custom_crop_chilipepper|custom_crop_lime