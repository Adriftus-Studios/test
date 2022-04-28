debug_bow:
  type: item
  material: bow
  display name: <&d>Debug Bow

debug_bow_event:
  type: world
  debug: false
  events:
    on player shoots debug_bow:
      - narrate <context.entity>
      - narrate <context.projectile>
      - narrate <context.bow>
      - narrate <context.force>
      - narrate <context.item>