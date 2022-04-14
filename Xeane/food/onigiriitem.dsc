custom_food_onigiri:
  type: item
  debug: false
  material: apple
  display name: <&a>Onigiri
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 933
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_rice|kelp|custom_crop_sesameseeds