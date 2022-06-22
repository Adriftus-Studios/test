bucket_testing_events:
  type: world
  debug: false
  events:
    on player right clicks cow with:bucket_*_milk_half|!bucket_*_*|bucket_*:
      - ratelimit <player> 2t
      - define item <context.item>
      # Empty Wooden Bucket -> Replace with filled bucket
      - if <[item].script.name> == bucket_wood:
        - inventory set slot:<player.held_item_slot> o:<item[bucket_wood_milk]> d:<player.inventory>
      # Empty Bucket -> Replace with partially/half filled bucket
      - else if <[item].flag[quantity]> == 0:
        - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk_half]> d:<player.inventory>
      # Partially filled Bucket -> Do logic
      - else:
        # Add 1 to quantity if less than maximum capacity
        - if <[item].flag[quantity].add[1]> < <script[buckets_config].data_key[<[item].flag[material]>]>:
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk].with_flag[quantity:+:1]> d:<player.inventory>
        # Replace with filled bucket
        - else:
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk]> d:<player.inventory>
      - determine cancelled
    on player fills bucket priority:10:
      - determine cancelled
    on player empties bucket priority:10:
      - determine cancelled

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

bucket_wood_milk:
  type: item
  debug: false
  material: bucket
  display name: Wooden Bucket of Milk
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[wood]>"
  mechanisms:
    custom_model_data: 12
  flags:
    material: wood
    contents: milk
    quantity: 1

bucket_iron:
  type: item
  debug: false
  material: bucket
  display name: <&f>Iron Bucket
  lore:
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 2
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
  material: bucket
  display name: Iron Bucket of Milk
  lore:
    - "<&6>Quantity: <&e><script.flag[quantity]>"
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 22
  flags:
    material: iron
    contents: milk
    quantity: 2

bucket_iron_milk_half:
  type: item
  debug: false
  material: bucket
  display name: Iron Bucket of Milk
  lore:
    - "<&6>Quantity: <&e><script.flag[quantity]>"
    - "<&6>Capacity: <&e><script[buckets_config].data_key[iron]>"
  mechanisms:
    custom_model_data: 22
  flags:
    material: iron
    contents: milk
    quantity: 1

# -- BUCKETS CONFIG
buckets_config:
  type: data
  wood: 1
  iron: 2
  diamond: 3
  netherite: 5
