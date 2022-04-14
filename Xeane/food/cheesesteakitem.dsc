custom_food_cheesesteak:
  type: item
  debug: false
  material: apple
  display name: <&a>Cheese Steak
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>20 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 490
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_toast|beef|custom_food_cheese|custom_crop_bellpepper|custom_crop_onion