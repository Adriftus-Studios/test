thisscriptisbork:
    type: world
    events:
        on player breaks block:
            - if <player.item_in_hand.script.name>:
                - narrate <player.item_in_hand.script.name>