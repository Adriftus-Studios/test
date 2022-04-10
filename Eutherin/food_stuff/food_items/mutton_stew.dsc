custom_food_mutton_stew:
  material: rabbit_stew
  debug: false
  display name: <&f>Mutton Stew
  mechanisms:
    custom_model_data: 2
  type: item
  data:
    amount: 12
    saturation: 8
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: potato|carrot|mutton|custom_crop_onion|bowl
