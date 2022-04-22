confirm_Script_Text:
    type: task
    debug: false
    definitions: callback
    script:
        - flag player callback:<[callback]>
        - clickable CST_callback def:true save:Confirm usages:1 until:30s
        - clickable CST_callback def:false save:Cancel usages:1 until:30s
        - narrate "Are you sure about this?"
        - narrate <&hover[Confirm].type[show_text]><element[<green><bold><underline>[Yes]].on_click[<entry[Confirm].command>]><&end_hover><reset>
        - narrate <&hover[Cancel].type[show_text]><element[<red><bold><underline>[No]].on_click[<entry[Cancel].command>]><&end_hover><reset>
#Very approved
CST_callback:
  type: task
  debug: false
  definitions: bool
  script:
    - if <[bool]> && <player.has_flag[callback]>:
      - inject <player.flag[callback]>
    - else if <[bool]> == false:
        - narrate <red><bold>Cancelled.<reset>
    - flag player callback:!
#Very approved

# - Timeout required

# |---          How to use the confirmation menu in other scripts (Example)         ---|
# | In command script -
# | script:
# | - run confirmScriptText def:relevantTaskScript