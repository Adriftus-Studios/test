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
    - announce <script[event_registry_<[event]>].data_key[info].get[warning_message]> if:<script[event_registry_<[event]>].data_key[info].get[warning_message].exists>
    - wait 10s
    - flag server events.active.<[event]> expire:<[duration]>

random_event_start:
    type: task
    script:
        - define random_event <server.flag[events.pool].random>
        - run event_start def.event:<[random_event]>

event_registry:
    type: world
    debug: false
    events:
        after script reload:
            - flag server events.registered:<list>
            - flag server events.pool:<list>
            - foreach <util.scripts.filter_tag[<[filter_value].name.starts_with[event_entry_]>]> as:e:
                - flag server events.registered.<[e].name.after[event_entry_]>:<[e].data_key[info].get[weight]>
                - flag server events.pool:<server.flag[events.pool].include[<[e].name.after[event_entry_].repeat_as_list[<[e].data_key[info].get[weight]>]>]>
                - announce to_console "<green>Registed event <[e].after[event_entry_]> with weight <[e].data_key[info].get[weight]>!"

event_command:
    type: command
    name: event
    description: Start, stop, disable, or enable an event.
    usage: /event <&lt>start/stop/disable/enable<&gt> <&lt>event<&gt> <&lc>duration<&rc>
    permission: events.event_command
    script:
    - narrate Hello!
