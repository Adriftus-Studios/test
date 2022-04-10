custom_food_sushi_tropical:
  material: dried_kelp
  debug: false
  display name: <&f>Tropical Sushi
  mechanisms:
    custom_model_data: 4
  type: item
  data:
    amount: 5
    saturation: 4
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: custom_crop_rice|dried_kelp|tropical_fish
