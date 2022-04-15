custom_food_chickencelerycasserole:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Celery Casserole
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 506
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_celery|chicken|custom_crop_garlic|carrot|brown_mushroom/red_mushroom/custom_crop_whitemushroom