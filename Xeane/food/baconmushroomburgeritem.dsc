custom_food_baconmushroomburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Bacon Mushroom Burger
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 361
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundbeef|porkchop|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_ingredient_mayonaiseitem|bread