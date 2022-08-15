warden_boss:
  type: entity
  debug: false
  entity_type: warden
  flags:
    on_spawn: warden_test

warden_test:
  type: task
  debug: false
  script:
    - announce TEST