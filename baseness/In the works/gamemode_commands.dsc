switch_gamemode_survival_creative:
    type: command
    debug: false
    name: switch_gamemode
    description: Switches the player between Creative and Survival.
    usage: /switch_gamemode
    aliases:
        - swgm
    permissions: modelock.creative; modelock.survival;
    permission message: <red><bold>Access denied.
    script:
        - if <player.gamemode> == CREATIVE:
            - adjust <player> gamemode:survival
            - narrate "<yellow><bold><underline>Switched to Survival mode.<reset>"
        - else if <player.gamemode> == SURVIVAL:
            - adjust <player> gamemode:creative
            - narrate "<yellow><bold><underline>Switched to Creative mode.<reset>"

select_gamemode_command:
    type: command
    debug: false
    name: select_gamemode
    description: Opens a menu to select a particular gamemode.
    usage: /select_gamemode
    aliases:
        - segm
    script:
        - clickable select_gamemode_callback def:<element[creative]> save:creative usages:1
        - clickable select_gamemode_callback def:<element[survival]> save:survival usages:1
        - clickable select_gamemode_callback def:<element[adventure]> save:adventure usages:1
        - clickable select_gamemode_callback def:<element[spectator]> save:spectator usages:1
        - narrate "Select a gamemode:"
        - narrate "<&hover[Click here to switch to Creative mode.].type[show_text]><element[<yellow><bold><underline>[Creative]].on_click[<entry[creative].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Survival mode.].type[show_text]><element[<yellow><bold><underline>[Survival]].on_click[<entry[survival].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Adventure mode.].type[show_text]><element[<yellow><bold><underline>[Adventure]].on_click[<entry[adventure].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Spectator mode.].type[show_text]><element[<yellow><bold><underline>[Spectator]].on_click[<entry[spectator].command>]><&end_hover><reset>"
#

select_gamemode_callback:
    type: task
    debug: false
    definitions: gamemode
    script:
        # - flag player callback:<[callback]>
        - else if <[gamemode]> == creative && <player.has_flag[callback]>:
            - adjust <player> gamemode:creative
            - narrate "<green>You have switched to <bold><underline>Creative<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == survival && <player.has_flag[callback]>:
            - adjust <player> gamemode:survival
            - narrate "<green>You have switched to <bold><underline>Survival<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == adventure && <player.has_flag[callback]>:
            - adjust <player> gamemode:adventure
            - narrate "<green>You have switched to <bold><underline>Adventure<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == spectator && <player.has_flag[callback]>:
            - adjust <player> gamemode:spectator
            - narrate "<green>You have switched to <bold><underline>Spectator<reset><green> mode."
            - flag player callback:!
#Not working; for testing only