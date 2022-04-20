custom_food_peasandcelery:
  type: item
  debug: false
  material: apple
  display name: <&a>Peas and Celery
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 999
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_celery|custom_crop_peas|custom_crop_lemon|custom_ingredient_blackpepperitem