Xeane_test_initialize:
  type: world
  debug: false
  events:
    on server start:
      - announce "Test server is live!"
    on player breaks block bukkit_priority:MONITOR:
      - narrate "<&a>You have broken <context.material.translated_name>"
