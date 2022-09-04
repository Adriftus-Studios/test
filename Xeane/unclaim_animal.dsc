unclaim_animal:
  type: world
  debug: false
  events:
    on player damages animal bukkit_priority:HIGHEST:
      - stop if:<context.entity.owner.exists.not>
      - stop if:<context.entity.owner.equals[<player>].not>
      - if <player.is_sneaking>:
        - determine passively cancelled
        - if <context.entity.has_flag[remove_owner]>:
          - adjust <context.entity> owner
          - narrate "<&a>You have given up ownership of this animal."
        - else:
          - flag <context.entity> remove_owner expire:10s
          - narrate "<&a>Sneak Punch again to remove your ownership of this animal."