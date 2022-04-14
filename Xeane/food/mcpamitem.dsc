custom_food_mcpam:
  type: item
  debug: false
  material: apple
  display name: <&a>McPam
  data:
    amount: 21
    saturation: 25
  lore:
  - <&e>Hunger: <&f>21 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>25 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 877
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundbeef|custom_crop_lettuce|custom_crop_onion|custom_ingredient_relishitem|custom_ingredient_mayonaiseitem|bread