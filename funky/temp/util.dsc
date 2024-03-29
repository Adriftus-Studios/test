human_to_bool:
    type: procedure
    definitions: c
    script:
        - choose <[c].to_lowercase>:
            - case true on yes positive yeah yup accurate correct:
                - determine true
            - case false off no negative nope nup inaccurate incorrect:
                - determine false
            - default:
                - determine unknown

get_name:
    type: procedure
    definitions: c
    script:
    - choose <[c].object_type>:
        - case Element:
            - determine "<[c].strip_color.replace[_].with[ ].to_titlecase>"
        - case Material:
            - determine "<[c].name.replace[_].with[ ].to_titlecase>"
        - case Item:
            - determine "<[c].display.strip_color.if_null[<[c].material.name.replace[_].with[ ].to_titlecase>]>"
        - case Entity Player:
            - determine <[c].name.strip_color.if_null[<[c].entity_type.proc[get_name]>]>
        - case Town Nation:
            - determine "<[c].name.replace[_].with[ ].strip_color.to_titlecase>"
        - case List:
            - determine <[c].parse_tag[<[parse_value].proc[get_name]>]>
        - case Map:
            - determine <[c].parse_value_tag[<[parse_value].proc[get_name]>]>
        - case Location:
            - define c <[c].round_down>
            - determine "<[c].x> <[c].y> <[c].z> in the <[c].world.environment.proc[get_lower_name].replace[normal].with[overworld]>"
        - case Inventory:
            - determine <[c].title.if_null[<[c].inventory_type.proc[get_name]>]>
        - case World:
            - determine "<[c].name.replace[_].with[ ]>"
        - case Script:
            - determine <[c].name.proc[get_name]>
        - default:
            - determine UNSUPPORTED_<[c].object_type.to_uppercase>_OBJECT_ERROR

get_lower_name:
    type: procedure
    definitions: c
    script:
        # get name but in lowercase
        - determine <[c].proc[get_name].to_lowercase>

get_world_location_name:
    type: procedure
    definitions: c
    script:
        # get location name but with the world name instead of the environment
        - determine <[c].proc[get_name].to_lowercase>
