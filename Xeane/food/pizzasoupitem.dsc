custom_food_pizzasoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Pizza Soup
  data:
    amount: 20
    saturation: 24
  lore:
  - <&e>Hunger: <&f>20<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>24<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1032
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_tomatosoup|custom_crop_onion|custom_crop_bellpepper|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_crop_garlic|custom_food_cheese