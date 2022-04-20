saltprevent:
    type: world
    debug: false
    events:
        on block spreads location_flagged:salt:
            - determine cancelled

salt_item:
    type: item
    material: sugar
    display name: <yellow>Salt

saltusage:
    type: world
    events:
        on player right clicks dirt with:salt_item:
            - flag <context.location> salt:<player>
            - narrate "<green>Block Salted"

saltremoval:
    type: world
    events:
        on weather rains:
        - flag server salt:!

saltobtain:
    type: world
    events:
        on player breaks stone:
         - define chance <util.random.int[1].to[15]>
         - choose  <[chance]>:
                - case 1:
                    - drop salt_item
                - default:
                    - stop
