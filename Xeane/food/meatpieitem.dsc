custom_food_meatpie:
  type: item
  debug: false
  material: apple
  display name: <&a>Meat Pie
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>19 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 881
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_ingredient_doughitem|custom_crop_onion|custom_crop_garlic|custom_ingredient_blackpepperitem|custom_food_stock