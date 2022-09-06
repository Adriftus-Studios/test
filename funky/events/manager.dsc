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
        - define random_event <server.flag[events.pool].exclude[<server.flag[events.disabled]>].random>
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
    usage: /event <&lt>start/stop/disable/enable<&gt> <&lc>event<&rc> <&lc>duration<&rc>
    permission: events.event_command
    tab completions:
        1: start|stop|disable|enable
        2: <server.flag[events.registered]>
        3: <script[event_entry_<context.args.get[2]>].data_key[info].get[duration].invert.keys>
    script:
        - define a <context.args>
        - if <[a].size> < 1:
            - narrate <gray>/<script.data_key[name]>
            - narrate <white><script.data_key[description]>
            - narrate "<white>Usage: <script.data_key[usage]>"
            - stop
        - else if <[a].size> > 3:
            - narrate "<red>Too many arguments!"
            - narrate "<red>Usage: <script.data_key[usage]>"
            - stop
        - if <[a].size> == 1 && <[a].get[1]> == stop:
            - flag server events.active:!
            - narrate "<green>Stopped all events!"
            - stop
        - if <[a].get[2]||null> not in <server.flag[events.registered]>:
            - narrate "<red>Unknown event <&sq><[a].get[2]><&sq>!"
            - stop
        - choose <[a].get[1]>:
            - case start:
                - if <[a].get[3].exists>:
                    - run event_start def.event:<[a].get[2]> def.duration:<[a].get[3]>
                - else:
                    - run event_start def.event:<[a].get[2]>
            - case stop:
                - if <server.flag[events.active].keys.if_null[<list>].contains[<[a].get[2]>].not>:
                    - narrate "<red>That event isn't currently active!"
                    - stop
                - flag server events.active.<[a].get[2]>:!
            - case disable:
                - if <server.flag[events.disabled].contains[<[a].get[2]>]>:
                    - narrate "<red>That event is already disabled!"
                    - stop
                - flag server events.disabled:->:<[a].get[2]>
            - case enable:
                - if <server.flag[events.disabled].contains[<[a].get[2]>].not>:
                    - narrate "<red>That event isn't disabled!"
                    - stop
                - flag server events.disabled:<-:<[a].get[2]>
            - default:
                - narrate "<red>Unknown argument <&sq><[a].get[1]><&sq>"
