bucket_testing_events:
  type: world
  debug: false
  events:
    on player fills bucket:
      - narrate "Item<&co> <context.item>"
      - narrate "Location<&co> <context.location>"
      - narrate "<context.material>"

    on player empties bucket:
      - narrate "Item<&co> <context.item>"
      - narrate "Location<&co> <context.location>"
      - narrate "Relative<&co> <context.relative>"

