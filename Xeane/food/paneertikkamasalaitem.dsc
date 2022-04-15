custom_food_paneertikkamasala:
  type: item
  debug: false
  material: apple
  display name: <&a>Paneer Tikka Masala
  data:
    amount: 35
    saturation: 42
  lore:
  - <&e>Hunger: <&f>35<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>42<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 951
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_paneer|custom_ingredient_garammasalaitem|custom_ingredient_currypowderitem|custom_crop_coconut|custom_crop_onion|custom_crop_bellpepper|custom_crop_tomato|custom_crop_ginger