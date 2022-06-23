bucket_netherite:
  type: item
  debug: false
  material: bucket
  display name: <&f>Netherite Bucket
  lore:
    - "<&e><script[buckets_flavor_text].data_key[netherite]>"
    - ""
    - "<&6>Capacity: <&e>0<&6>/<&e><script[buckets_config].data_key[netherite]>"
  mechanisms:
    custom_model_data: 4
  data:
    recipe_book_category: misc
  flags:
    material: netherite
    quantity: 0
    unique: <server.current_time_millis>
  recipes:
    1:
      type: shaped
      input:
        - netherite_ingot|bucket_diamond|netherite_ingot
        - air|netherite_ingot|air

bucket_netherite_milk:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Netherite Bucket of Milk
  lore:
    - "<&e><script[buckets_flavor_text].data_key[netherite]>"
    - ""
    - "<&6>Quantity: <&e><script[buckets_config].data_key[netherite]><&6>/<&e><script[buckets_config].data_key[netherite]>"
  mechanisms:
    custom_model_data: 4
  flags:
    material: netherite
    contents: milk
    quantity: 5
    unique: <server.current_time_millis>

bucket_netherite_milk_half:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Netherite Bucket of Milk
  lore:
    - "<&e><script[buckets_flavor_text].data_key[netherite]>"
    - ""
    - "<&6>Quantity: <&e>1<&6>/<&e><script[buckets_config].data_key[netherite]>"
  mechanisms:
    custom_model_data: 4
  flags:
    material: netherite
    contents: milk
    quantity: 1
    unique: <server.current_time_millis>
