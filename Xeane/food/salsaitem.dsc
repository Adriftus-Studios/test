custom_food_salsa:
  type: item
  debug: false
  material: apple
  display name: <&a>Salsa
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 170
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_tomato|custom_crop_onion|custom_crop_spiceleaf|custom_crop_lime|custom_crop_garlic