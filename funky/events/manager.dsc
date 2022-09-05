event_start:
    type: task
    definitions: event|duration
    script:
    - flag server events.active.<[event]> expire:<[duration]>

event_registry:
    type: world
    debug: false
    events:
        after script reload:
            - foreach <util.scripts.parse_tag[<[parse_value].starts_with[event_entry_]>]> as:e:
                - flag server events.registered.<[e].after[event_entry_]>
                - announce to_console "<green>Registed event <[e]>!"
