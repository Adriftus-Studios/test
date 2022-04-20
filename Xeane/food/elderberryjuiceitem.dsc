custom_food_elderberryjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Elderberry Juice
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 638
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_elderberry|custom_crop_elderberry