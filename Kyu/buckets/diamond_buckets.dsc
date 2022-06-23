bucket_diamond:
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
  flags:
    material: diamond
    quantity: 0
    unique: <server.current_time_millis>
  recipes:
    1:
      type: shaped
      input:
        - diamond|bucket_iron|diamond
        - air|diamond|air

bucket_diamond_milk:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Diamond Bucket of Milk
  lore:
    - "<&e><script[buckets_flavor_text].data_key[diamond]>"
    - ""
    - "<&6>Quantity: <&e><script[buckets_config].data_key[diamond]><&6>/<&e><script[buckets_config].data_key[diamond]>"
  mechanisms:
    custom_model_data: 3
  flags:
    material: diamond
    contents: milk
    quantity: 3
    unique: <server.current_time_millis>

bucket_diamond_milk_half:
  type: item
  debug: false
  material: milk_bucket
  display name: <&f>Diamond Bucket of Milk
  lore:
    - "<&e><script[buckets_flavor_text].data_key[diamond]>"
    - ""
    - "<&6>Quantity: <&e>1<&6>/<&e><script[buckets_config].data_key[diamond]>"
  mechanisms:
    custom_model_data: 3
  flags:
    material: diamond
    contents: milk
    quantity: 1
    unique: <server.current_time_millis>
