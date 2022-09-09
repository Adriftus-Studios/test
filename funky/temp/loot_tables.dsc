get_weighted_response:
    type: procedure
    definitions: c
    # input: a list of items and their weights
    #/example
    # item:1.0|item:2.0|item:3.0
    # output: a random item from the list
    #/example
    # item
    script:
        - define origin <[c]>
        - define c <[c].parse_tag[<[c].after[<&co>]>]>
        - define val <util.random.decimal[<[c].lowest>].to[<[c].highest>]>
        - define check <[c].highest>
        - foreach <[c]> as:i:
            - if <[check]> <= <[val]>:
                # return the item of <[i]>
                - determine <[origin].get[<[c].find[<[i]>]>].before[<&co>]>
            - define check <[check].sub[<[i]>]>
        - determine <[origin].random.before[<&co>]>
