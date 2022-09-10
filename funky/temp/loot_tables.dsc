get_weighted_response_from_list:
    type: procedure
    definitions: c
    # input: a list of items and their weights
    #/example
    # cooked_chicken:1.0|baked_potato:2.0|charcoal:3.0
    # output: a random item from the list
    #/example
    # baked_potato

    # how does weighting work?
    # if you list make a list of values and values and weight and such
    # then values and stuff with divide and youll get a super cool item
    # and then youll get a random item from the list
    # and then youll get a random item from the list
    # and then youll get a random item from the list
    script:
        - define origin <[c]>
        - define c <[c].parse_tag[<[c].after[<&co>]>]>
        - define val <util.random.decimal[<[c].lowest>].to[<[c].highest>]>
        - define check <[c].lowest>
        - foreach <[c].random[<[c].size>]> as:i:
            - if <[val]> <= <[check]>:
                # return the item of <[i]>
                - determine <[origin].get[<[c].find[<[i]>]>].before[<&co>]>
            - define check <[check].add[<[i]>]>
        # theoretically, this determine should NEVER be reached, but it's here just in case something goes horribly wrong
        - determine <[origin].random.before[<&co>]>

generate_weight_list:
    type: procedure
    definitions: c
    # input: a map of items and their weights
    #/example
    # cooked_chicken: 1.0
    # baked_potato: 2.0
    # charcoal: 3.0
    # output: a list of items and their weights
    #/example
    # cooked_chicken:1.0|baked_potato:2.0|charcoal:3.0
    script:
        - determine <[c].to_list[<&co>]>

get_weighted_response_from_map:
    type: procedure
    definitions: c
    script:
        - determine <[c].proc[generate_weight_list].proc[get_weighted_response_from_list]>

generate_weight_map:
    type: procedure
    definitions: c
    # input: a list of items and their weights
    #/example
    # cooked_chicken:1.0|baked_potato:2.0|charcoal:3.0
    # output: a map of items and their weights
    #/example
    # cooked_chicken: 1.0
    # baked_potato: 2.0
    # charcoal: 3.0
    script:
        - determine <[c].to_map[<&co>]>

loot_data_script:
    type: procedure
    definitions: c
    # input: a data script with the key "weight_map" containing a map of items and their weights
    #/example
    # my_loot_table:
    #   type: data
    #   weight_map:
    #     cooked_chicken: 1.0
    #     baked_potato: 2.0
    #     charcoal: 3.0
    # output: a list of items and their weights
    #/example
    # cooked_chicken:1.0|baked_potato:2.0|charcoal:3.0
    script:
        - determine <[c].data_key[weight_map].proc[generate_weight_list]>

get_weighted_response_from_data_script:
    type: procedure
    definitions: c
    # input: a data script with the key "weight_map" containing a map of items and their weights
    #/example
    # my_loot_table:
    #   type: data
    #   weight_map:
    #     cooked_chicken: 1.0
    #     baked_potato: 2.0
    #     charcoal: 3.0
    # output: a random item from the map
    #/example
    # baked_potato
    script:
        - determine <[c].proc[loot_data_script].proc[get_weighted_response_from_list]>
