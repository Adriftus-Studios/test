custom_food_sauerbraten:
  type: item
  debug: false
  material: apple
  display name: <&a>Sauerbraten
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1116
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_ingredient_vinegaritem|water_bucket/custom_ingredient_freshwateritem|custom_crop_spiceleaf|potato