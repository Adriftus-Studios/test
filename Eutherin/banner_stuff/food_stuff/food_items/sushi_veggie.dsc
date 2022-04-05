custom_food_sushi_veggie:
  material: dried_kelp
  debug: false
  display name: <&f>Veggie Sushi
  mechanisms:
    custom_model_data: 7
  type: item
  data:
    amount: 5
    saturation: 5
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: custom_crop_rice|dried_kelp|carrot|beetroot
