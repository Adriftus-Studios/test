impl_skilltree_Mage:
  type: data

  # The internal name of the skill tree (this MUST be unique)
  name: mage

  # The display item of the skill tree for GUIs
  display_item_script: impl_skillTree_mage_icon

  # Tags that will be checked to see if a player can have this skill tree
  requirements:
  - "<player.has_flag[class]>"
  - "<player.flag[class].equals[Mage]>"

  # Base command to use Skills from this Skill Tree
  # Command Script MUST be made in this file
  base_command: mage

impl_skillTree_mage_icon:
  type: item
  material: feather
  display name: "<&a>Mage Skills"
  lore:
  - "<&a>Skills for the Mage Class"
  mechanisms:
    custom_model_data: 3

impl_skillTree_warrior_events:
  type: world
  debug: false
  events:
    on player kills entity flagged:class.mage:
      - run skill_core_lose_experience def:mage|1
