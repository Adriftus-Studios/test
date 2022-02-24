inventory_class_selector_events:
  type: world
  debug: false
  events:
    on player clicks in inventory_class_selector:
    - if <context.item.script.data_key[data.class_impl].exists>:
      - define impl <context.item.script.data_key[data.class_impl].as_script>
      - define class <[impl].data_key[name]>
      - run class_weapon_add_skillTree def:<[class]>

inventory_class_selector:
  type: inventory
  inventory: chest
  size: 45
  title: Class Selector
  gui: true
  definitions:
    f: <item[standard_filler]>
  slots:
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [f] [inventory_class_selector_mage_icon] [f] [f] [f] [inventory_class_selector_ranger_icon] [f] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [f] [inventory_class_selector_rogue_icon] [f] [f] [f] [] [f] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]

inventory_class_selector_mage_icon:
  type: item
  material: feather
  display name: "<&a>Mage"
  data:
    class_impl: impl_skilltree_Mage
  mechanisms:
    custom_model_data: 3

inventory_class_selector_ranger_icon:
  type: item
  material: feather
  display name: "<&a>Ranger"
  data:
    class_impl: impl_skilltree_Ranger
  mechanisms:
    custom_model_data: 2

inventory_class_selector_rogue_icon:
  type: item
  material: feather
  display name: "<&a>Rogue"
  data:
    class_impl: impl_skilltree_Rogue
  mechanisms:
    custom_model_data: 4
