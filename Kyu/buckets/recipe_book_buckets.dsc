# -- Any Planks
any_planks:
  type: item
  debug: false
  material: oak_planks
  display name: <&f>Any Planks
  lore:
    - "<&e>You can use any kind of planks."

# Wooden Bucket
bucket_wood_display:
  type: item
  debug: false
  material: bucket
  display name: <&f>Wooden Bucket
  lore:
    - "<&e><script[buckets_flavor_text].data_key[wood]>"
    - ""
    - "<&6>Quantity: <&e>0<&6>/<&e>1"
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

# Iron Bucket
bucket_iron_display:
  type: item
  debug: false
  material: bucket
  display name: <&f>Iron Bucket
  lore:
    - "<&e><script[buckets_flavor_text].data_key[iron]>"
    - ""
    - "<&6>Quantity: <&e>0<&6>/<&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 2
  data:
    recipe_book_category: misc
  recipes:
    1:
      type: shaped
      input:
        - iron_ingot|bucket_wood_display|iron_ingot
        - air|iron_ingot|air

# Diamond Bucket
bucket_diamond_display:
  type: item
  debug: false
  material: bucket
  display name: <&f>Diamond Bucket
  lore:
    - "<&e><script[buckets_flavor_text].data_key[diamond]>"
    - ""
    - "<&6>Quantity: <&e>0<&6>/<&e><script[buckets_config].data_key[diamond]>"
  mechanisms:
    custom_model_data: 3
  data:
    recipe_book_category: misc
  recipes:
    1:
      type: shaped
      input:
        - diamond|bucket_iron_display|diamond
        - air|diamond|air

# Netherite Bucket
bucket_netherite_display:
  type: item
  debug: false
  material: bucket
  display name: <&f>Netherite Bucket
  lore:
    - "<&e><script[buckets_flavor_text].data_key[netherite]>"
    - ""
    - "<&6>Quantity: <&e>0<&6>/<&e><script[buckets_config].data_key[netherite]>"
  mechanisms:
    custom_model_data: 4
  data:
    recipe_book_category: misc
  recipes:
    1:
      type: shaped
      input:
        - netherite_ingot|bucket_diamond_display|netherite_ingot
        - air|netherite_ingot|air
