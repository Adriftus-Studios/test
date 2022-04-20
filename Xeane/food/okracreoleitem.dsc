custom_food_okracreole:
  type: item
  debug: false
  material: apple
  display name: <&a>Okra Creole
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 928
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_okra|custom_crop_garlic|custom_crop_tomato|custom_crop_bellpepper|custom_crop_onion|custom_crop_spiceleaf