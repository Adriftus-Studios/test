custom_food_futomaki:
  type: item
  debug: false
  material: apple
  display name: <&a>Futomaki
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 686
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_boiledegg|custom_crop_cucumber|custom_crop_wintersquash|custom_crop_radish|kelp|custom_crop_ginger|custom_crop_rice