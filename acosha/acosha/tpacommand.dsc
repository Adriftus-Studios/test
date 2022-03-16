
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
       - if <context.args.size> < 1:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - define player <server.match_player[<context.args.get[1]>].if_null[null]>
       - if <[player]> = null:
            - narrate "<red><bold>This Is Not A Player"
            - stop
       - if <[player]> = <player.name>:
               - narrate "You Can Not Tpaccept Yourself"
               - stop
       - else:
              - flag player callback:<[callback]>
              - clickable confirmScriptText_callback def:true save:Confirm usages:1
              - clickable confirmScriptText_callback def:false save:Cancel usages:1
              - narrate "Are you sure about this?"
              - narrate <&hover[Confirm].type[show_text]><element[<green><bold><underline>[Yes]].on_click[<entry[Confirm].command>]><&end_hover><reset> targets: <[player]>
              - narrate <&hover[Cancel].type[show_text]><element[<red><bold><underline>[No]].on_click[<entry[Cancel].command>]><&end_hover><reset> targets: <[player]>

confirmScriptText_callback:
  type: task
  debug: false
  definitions: bool
  script:
    - if <[bool]> && <player.has_flag[callback]>:
      - inject <player.flag[callback]>
    - else if <[bool].equals[false]>:
        - narrate <red><bold>Cancelled.<reset>
    - flag player callback:!


tpaccept_command:
    type: command
    name: tpaccept
    description: Used To Request A Teleport
    usage: /tpaccept (name)
    script:
           - if <context.args.size> < 1:
               - narrate "<red><bold>Please Use A Name That's Online"
               - stop
           - define name <server.match_player[<context.args.get[1]>].if_null[null]>
           - if <[name]> = null:
               - narrate "<red><bold>This Is Not A Player"
               - stop
           - if <[name]> = <player.name>:
               - narrate "You Can Not Tpaccept Yourself"
               - stop
           - else:
               - if <player.has_flag[tpaccept]> :
                    - narrate "<yellow>Teleporting In 3" targets:<[name]>|<player>
                    - wait 1s
                    - narrate "<yellow>Teleporting In 2" targets:<[name]>|<player>
                    - wait 1s
                    - narrate "<yellow>Teleporting In 1" targets:<[name]>|<player>
                    - wait 1s
                    - teleport <[name]> <player.location>
                    - narrate "<green>Player Teleported"
                    - flag <player> tpaccept:!
                    - stop
               - else:
                    - narrate "No Pending Teleportations"
                    - stop



