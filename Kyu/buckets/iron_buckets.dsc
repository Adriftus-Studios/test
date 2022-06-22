bucket_iron:
  type: item
  debug: false
  material: bucket
  display name: <&f>Iron Bucket
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 2
  data:
    recipe_book_category: misc
  flags:
    material: iron
    quantity: 0
  recipes:
    1:
      type: shaped
      input:
        - iron_ingot|bucket_wood|iron_ingot
        - air|iron_ingot|air

bucket_iron_milk:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Iron Bucket of Milk
  lore:
    - "<&6>Quantity: <&e><script[buckets_config].data_key[iron]>"
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 2
  flags:
    material: iron
    contents: milk
    quantity: 2

bucket_iron_milk_half:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Iron Bucket of Milk
  lore:
    - "<&6>Quantity: <&e>1"
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 2
  flags:
    material: iron
    contents: milk
    quantity: 1