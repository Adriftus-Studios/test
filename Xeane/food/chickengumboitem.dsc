custom_food_chickengumbo:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Gumbo
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>23 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 511
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_okra|chicken|custom_crop_celery|custom_crop_onion|custom_food_stock|custom_crop_spiceleaf|custom_crop_bellpepper