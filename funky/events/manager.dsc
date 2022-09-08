event_start:
    type: task
    definitions: event|duration
    script:
    - if <[event]> not in <server.flag[events.registered].if_null[<list>]>:
        - narrate "<red>Unknown event <&sq><[event]><&sq>!"
    - if <[duration].exists.not>:
        - define min <duration[<script[event_entry_<[event]>].data_key[info].deep_get[duration.min]>]||<duration[1d]>>
        - define max <duration[<script[event_entry_<[event]>].data_key[info].deep_get[duration.max]>]||<duration[1d]>>
        - define duration <duration[<util.random.int[<[min].in_ticks>].to[<[max].in_ticks>]>t]>
    - if <script[event_entry_<[event]>].data_key[info].get[warning_message].exists>:
        - define wm <script[event_entry_<[event]>].data_key[info].get[warning_message]>
        - if <[wm].object_type> == List:
            - announce <script[event_entry_<[event]>].data_key[info].get[warning_message].random.parsed>
        - else:
            - announce <script[event_entry_<[event]>].data_key[info].get[warning_message].parsed>
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

event:
    type: command
    name: event
    description: Start, stop, disable, or enable an event.
    usage: /event <&lt>start/stop/disable/enable<&gt> <&lc>event<&rc> <&lc>duration<&rc>
    permission: events.event_command
    tab completions:
        1: start|stop|disable|enable
        2: <server.flag[events.registered].keys.include[all]>
        3: <script[event_entry_<context.args.get[2]>].data_key[info].get[duration].invert.keys>
    script:
        # define "a" as the arguments for convenience
        - define a <context.args>
        # arg 1 = action
        # arg 2 = event
        # arg 3 = duration

        # if no arguments are given, show the help message
        - if <[a].size> < 1:
            - narrate <empty>
            - narrate <gray>/<script.data_key[name]>
            - narrate <white><script.data_key[description].parsed>
            - narrate "<white>Usage: <script.data_key[usage].parsed>"
            - stop
        # if too many arguments are given, show the help message
        - else if <[a].size> > 3:
            - narrate "<red>Too many arguments!"
            - narrate "<red>Usage: <script.data_key[usage].parsed>"
            - stop
        # if there is one argument, stop, then stop all events
        - if ( <[a].size> == 1 || <[a].get[2]> == all ) && <[a].get[1]> == stop:
            - flag server events.active:!
            - narrate "<green>Stopped all events!"
            - stop
        # if there is one argument, disable, then disable all events
        - else if ( <[a].size> == 1 || <[a].get[2]> == all ) && <[a].get[1]> == disable:
            - flag server events.disabled:<server.flag[events.registered]>
            - narrate "<green>Disabled all available events."
            - stop
        # if there is one argument, enable, then enable all events
        - else if ( <[a].size> == 1 || <[a].get[2]> == all ) && <[a].get[1]> == enable:
            - flag server events.disabled:!
            - narrate "<green>Enabled all available events."
            - stop
        # if the action is start, and the event is "all", then go through all events and start them
        - if <[a].get[1]> == start && <[a].get[2]> == all:
            - foreach <server.flag[events.registered]> as:e:
                - if <[a].get[3].exists>:
                    - run event_start def.event:<[e]> def.duration:<[a].get[3]>
                    - narrate "<green>Started <[e]> for <[a].get[3].as[duration].formatted>!"
                - else:
                    - run event_start def.event:<[e]>
                    - narrate "<green>Started <[e]> for a randomly chosen duration!"
            - narrate <empty>
            - narrate "<green>Started all events!"
        # if the event specified doesn't exist, stop
        - else if <[a].get[2]||null> not in <server.flag[events.registered]>:
            - narrate "<red>Unknown event <&sq><[a].get[2].if_null[ ]><&sq>!"
            - narrate "<red>Available Events:"
            - foreach <server.flag[events.registered].keys.if_null[<list_single[None]>]> as:e:
                - narrate "<red>- <[e]>"
            - stop
        # after edge cases, go through normal cases
        - choose <[a].get[1]>:
            - case start:
                # if duration exists, use that, if not, use a random duration
                - if <[a].get[3].exists>:
                    - run event_start def.event:<[a].get[2]> def.duration:<[a].get[3]>
                    - narrate "<green>Started <[a].get[2]> for <[a].get[3].as[duration].formatted>!"
                - else:
                    - run event_start def.event:<[a].get[2]>
                    - narrate "<green>Started <[a].get[2]> for a randomly chosen duration!"
            - case stop:
                # if the event isn't active, stop
                - if <server.flag[events.active].keys.if_null[<list>].contains[<[a].get[2]>].not>:
                    - narrate "<red><[a].get[2]> event isn't currently active!"
                    - narrate "<red>Currently Active Events:"
                    - foreach <server.flag[events.active].keys.if_null[<list_single[None]>]> as:e:
                        - narrate "<red>- <[e]>"
                    - stop
                - flag server events.active.<[a].get[2]>:!
                - narrate "<green>Stopped <[a].get[2]> event!"
            - case disable:
                # if the event is already disabled, stop
                - if <server.flag[events.disabled].contains[<[a].get[2]>]>:
                    - narrate "<red>That event is already disabled!"
                    - narrate "<red>Currently Disabled Events:"
                    - foreach <server.flag[events.disabled].if_null[<list_single[None]>]> as:e:
                        - narrate "<red>- <[e]>"
                    - stop
                - flag server events.disabled:->:<[a].get[2]>
                - narrate "<green>Disabled <[a].get[2]> event!"
            - case enable:
                # if the event isn't disabled, stop
                - if <server.flag[events.disabled].contains[<[a].get[2]>].not>:
                    - narrate "<red>That event isn't disabled!"
                    - narrate "<red>Currently Disabled Events:"
                    - foreach <server.flag[events.disabled].if_null[<list_single[None]>]> as:e:
                        - narrate "<red>- <[e]>"
                    - stop
                - flag server events.disabled:<-:<[a].get[2]>
                - narrate "<green>Enabled <[a].get[2]> event!"
            - default:
                # if the action is unknown, stop
                - narrate "<red>Unknown argument <&sq><[a].get[1].to_lowercase><&sq>!"
                - narrate "<red>Usage: <script.data_key[usage].parsed>"
                - stop
