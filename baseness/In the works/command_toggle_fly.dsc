noncreative_flying:
    type: command
    debug: false
    name: Fly
    description: Toggles fly mode.
    usage: /fly
    script:
        - if <player.is_flying>:
            - narrate "<bold><yellow>You may fall."
            - run confirm_script_text def:noncreative_flying_task
        - else:
            - run noncreative_flying_task

noncreative_flying_task:
    type: task
    debug: false
    script:
        - if <player.gamemode> == CREATIVE:
            - narrate "<bold><yellow>You cannot use this command while in Creative Mode."
            - flag <player> noncreative_flying:!
            - stop
        - else if <player.has_flag[noncreative_flying]>:
            - adjust <player> can_fly:false
            - flag <player> noncreative_flying:!
            - narrate "<bold><yellow>You can no longer fly outside Creative Mode."
            - stop
        - adjust <player> can_fly:true
        - flag <player> noncreative_flying
        - narrate "<bold><yellow>You can now fly outside Creative Mode."