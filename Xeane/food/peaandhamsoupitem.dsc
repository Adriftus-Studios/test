custom_food_peaandhamsoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Peas and Ham Soup
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>19 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 977
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_peas|porkchop|custom_crop_onion|carrot|custom_crop_celery|custom_ingredient_blackpepperitem