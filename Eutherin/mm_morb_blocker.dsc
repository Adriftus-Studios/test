Mm_no_morb:
  Type: world
  Debug: false
  Events:
    After mythicmob mob spawns:
    - flag <context.entity> no_morb
    - flag <context.entity> on_mounted:cancel

