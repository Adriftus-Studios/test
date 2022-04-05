custom_food_sushi_cod:
  material: dried_kelp
  debug: false
  display name: <&f>Cod Sushi
  mechanisms:
    custom_model_data: 1
  type: item
  data:
    amount: 6
    saturation: 7
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: custom_crop_rice|dried_kelp|cod
