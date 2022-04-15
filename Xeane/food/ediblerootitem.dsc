custom_food_edibleroot:
  type: item
  debug: false
  material: apple
  display name: <&a>Edible Root
  data:
    amount: 2
    saturation: 2
  lore:
  - <&e>Hunger: <&f>2<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>2<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 629
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_spiceleaf