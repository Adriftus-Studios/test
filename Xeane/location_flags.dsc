block_properties:
  type: world
  debug: true
  events:
    on player places block location_flagged:no_build:
      - determine cancelled
    on player breaks block location_flagged:on_break:
      - inject <context.location.flag[on_break]>
    on player right clicks block_flagged:infinite_chest:
      - if <player.has_permission[adriftus.admin]> && <player.is_sneaking>:
        - narrate "<&a>Bypassing Infinite Chest Restriction With Admin Permissions."
      - else:
        - determine passively cancelled
        - inventory open d:generic[title=<&6><context.location.inventory.title>;size=36;contents=<context.location.inventory.list_contents>]