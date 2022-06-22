bucket_testing_events:
  type: world
  debug: false
  events:
    on player right clicks cow with:bucket_wood:
      - narrate "Test"
      - determine cancelled

    on player empties bucket:
      - narrate "Item<&co> <context.item>"
      - narrate "Location<&co> <context.location>"
      - narrate "Relative<&co> <context.relative>"
      - choose <context.item>:
        - case water_bucket:
          - narrate "Water"
        - case milk_bucket:
          - narrate "Milk"
        - case lava_bucket:
          - narrate "Begone, bucket!"

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
