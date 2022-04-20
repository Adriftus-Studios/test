custom_food_greentea:
  type: item
  debug: false
  material: apple
  display name: <&a>Green Tea
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>4<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 738
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_tealeaf|custom_crop_spiceleaf