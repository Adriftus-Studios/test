custom_food_stuffedeggplant:
  type: item
  debug: false
  material: apple
  display name: <&a>Stuffed Eggplant
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1174
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_eggplant|custom_crop_onion|custom_crop_bellpepper|custom_crop_avocado/custom_crop_banana