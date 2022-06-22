bucket_testing_events:
  type: world
  debug: false
  events:
    on player right clicks cow with:bucket_wood|bucket_*_milk_half:
      - determine passively cancelled
      - ratelimit <player> 1s
      - narrate "Test"
      - give <item[bucket].with[custom_model_data=13]>

bucket_wood:
  type: item
  debug: false
  material: bucket
  display name: Wooden Bucket
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[wood]>"
  mechanisms:
    custom_model_data: 1
  recipes:
    1:
      type: shaped
      input:
        - oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/mangrove_planks/crimson_planks/warped_planks|air|oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/mangrove_planks/crimson_planks/warped_planks
        - air|oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/mangrove_planks/crimson_planks/warped_planks|air

# -- BUCKETS CONFIG
buckets_config:
  type: data
  wood: 1
  iron: 2
  diamond: 3
  netherite: 5
