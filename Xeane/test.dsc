Xeane_test_initialize:
  type: world
  debug: false
  events:
    on server start:
      - announce "Test server is live!"
    # Intentional Bork - FIX AFTER TEST - TODO
    on delta time minutely:
      - narrate <player>
