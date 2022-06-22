bucket_wood:
  type: item
  debug: false
  material: bucket
  display name: <&f>Wooden Bucket
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[wood]>"
  mechanisms:
    custom_model_data: 1
  flags:
    material: wood
    quantity: 0
  recipes:
    1:
      type: shaped
      input:
        - stick|stick|stick
        - oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks|air|oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks
        - air|oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks|air

# oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/mangrove_planks/crimson_planks/warped_planks

bucket_wood_display:
  type: item
  debug: false
  material: bucket
  display name: <&f>Wooden Bucket
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[wood]>"
  mechanisms:
    custom_model_data: 1
  data:
    recipe_book_category: misc
  recipes:
    1:
      type: shaped
      input:
        - stick|stick|stick
        - any_planks|air|any_planks
        - air|any_planks|air


bucket_wood_milk:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Wooden Bucket of Milk
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[wood]>"
  mechanisms:
    custom_model_data: 1
  flags:
    material: wood
    contents: milk
    quantity: 1
