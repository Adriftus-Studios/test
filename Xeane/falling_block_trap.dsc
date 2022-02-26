falling_block_trap:
  type: task
  debug: false
  script:
    - define material <context.location.material>
    - modifyblock <context.location> air
    - spawn falling_block[fallingblock_entity=<[material]>] <context.location.center> save:block
    - flag <entry[block].spawned_entity> remove
    - wait 5s
    - modifyblock <context.location> <[material]>