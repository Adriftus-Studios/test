custom_food_sushi_salmon:
  material: dried_kelp
  debug: false
  display name: <&f>Salmon Sushi
  mechanisms:
    custom_model_data: 2
  type: item
  data:
    amount: 7
    saturation: 10
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: custom_crop_rice|dried_kelp|salmon
