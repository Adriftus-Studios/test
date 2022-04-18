item_carrier_pearl:
  type: item
  material: ender_pearl
  display name: <&e>Carrier Pearl
  lore:
  - <&7>Allows you to ride the ender
  - <&7>pearl as it goes through the air.
  flags:
    carrier_pearl: true

item_carrier_pearl_events:
  type: world
  debug: false
  events:
    after ender_pearl launched:
    - stop if:<context.entity.item.has_flag[carrier_pearl].not>
    - stop if:<context.entity.shooter.is_player.not.if_null[true]>
    - stop if:<context.entity.shooter.is_inside_vehicle>
    - adjust <context.entity> passenger:<context.entity.shooter>
    - flag <context.entity> on_dismount:->:cancel