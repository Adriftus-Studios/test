impl_skilltree_Rogue:
  type: data

  # The internal name of the skill tree (this MUST be unique)
  name: rogue

  # The display item of the skill tree for GUIs
  display_item_script: impl_skillTree_rogue_icon

  # Tags that will be checked to see if a player can have this skill tree
  requirements:
  - "<player.has_flag[class]>"
  - "<player.flag[class].equals[Rogue]>"

  # Base command to use Skills from this Skill Tree
  # Command Script MUST be made in this file
  base_command: rogue

impl_skillTree_rogue_icon:
  type: item
  material: feather
  display name: "<&a>Rogue Skills"
  lore:
  - "<&a>Skills for the Rogue Class"
  mechanisms:
    custom_model_data: 4
