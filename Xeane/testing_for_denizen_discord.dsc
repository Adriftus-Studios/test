test_world:
    type: world
    debug: false
    events:
        on player breaks block flagged:Xeane:
        - narrate "block broken"
        - modifyblock <context.location> diamond_ore
        on block drops item from breaking:
        - narrate "block dropped item"