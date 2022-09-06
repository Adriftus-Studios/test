event_start:
    type: task
    definitions: event|duration
    script:
    - if <[event]> not in <server.flag[events.registered].if_null[<list>]>:
        - narrate "<red>Unknown event '<[event]>'!"
    - if <[duration].exists.not>:
        - define min <duration[<script[event_entry_<[event]>].data_key[info].deep_get[duration.min]>]||<duration[1d]>>
        - define max <duration[<script[event_entry_<[event]>].data_key[info].deep_get[duration.max]>]||<duration[1d]>>
        - define duration <duration[<util.random.int[<[min].in_ticks>].to[<[max].in_ticks>]>t]>
    - flag server events.active.<[event]> expire:<[duration]>

event_registry:
    type: world
    debug: false
    events:
        after script reload:
            - flag server events.registered:<list>
            - foreach <util.scripts.filter_tag[<[filter_value].starts_with[event_entry_]>]> as:e:
                - flag server events.registered:->:<[e].after[event_entry_]>
                - announce to_console "<green>Registed event <[e]>!"
