custom_food_beef_stew:
  material: rabbit_stew
  debug: false
  display name: <&f>Beef Stew
  mechanisms:
    custom_model_data: 1
  type: item
  data:
    amount: 8
    saturation: 12
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: potato|carrot|beef|custom_crop_onion|bowl
