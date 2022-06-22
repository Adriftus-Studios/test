bucket_testing_events:
  type: world
  debug: false
  events:
    on player fills bucket:
      - narrate "Item<&co> <context.item>"
      - narrate "Script<&co> <context.item.script>"
      - narrate "Location<&co> <context.location>"
      - narrate "<context.material>"

    on player empties bucket:
      - narrate "Item<&co> <context.item>"
      - narrate "Location<&co> <context.location>"
      - narrate "Relative<&co> <context.relative>"

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
