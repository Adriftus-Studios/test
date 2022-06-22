# -- BUCKETS
buckets_handler:
  type: world
  debug: false
  events:
    # General
    on player fills bucket priority:10:
      - determine cancelled
    on player empties bucket priority:10:
      - determine cancelled

    # Milk Bucket
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
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk].with[lore=<&6>Quantity<&co><&sp><&e><[item].flag[quantity].add[1]>|<&6>Capacity<&co><&sp><&e><script[buckets_config].data_key[<[item].flag[material]>]>].with_flag[quantity:<[item].flag[quantity].add[1]>]> d:<player.inventory>
        # Replace with filled bucket
        - else:
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk]> d:<player.inventory>
      - determine cancelled

    on player consumes bucket_*_milk*:
      - determine cancelled


# -- BUCKETS CONFIG
buckets_config:
  type: data
  wood: 1
  iron: 2
  diamond: 3
  netherite: 5
