custom_food_sushi_pufferfish:
  material: dried_kelp
  debug: false
  display name: <&f>Puffer Sushi
  mechanisms:
    custom_model_data: 3
  type: item
  data:
    amount: 8
    saturation: 7
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: custom_crop_rice|dried_kelp|pufferfish
