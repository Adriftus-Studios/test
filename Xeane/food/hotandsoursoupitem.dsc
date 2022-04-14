custom_food_hotandsoursoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Hot and Sour Soup
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 774
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|porkchop|custom_ingredient_sesameoilitem|brown_mushroom/red_mushroom/custom_crop_whitemushroom|bamboo|custom_crop_avocado/custom_crop_banana|custom_ingredient_vinegaritem|custom_ingredient_blackpepperitem