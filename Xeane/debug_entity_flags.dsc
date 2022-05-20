debug_entity_flags:
  type: task
  debug: false
  script:
    - foreach <context.entity.list_flags>:
      - announce "<[value]> - <context.entity.flag[<[value]>]>"