custom_food_stuffing:
  type: item
  debug: false
  material: apple
  display name: <&a>Stuffing
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1177
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_toast|custom_crop_spiceleaf|custom_crop_celery|custom_food_stock