impl_skilltree_Ranger:
  type: data

  # The internal name of the skill tree (this MUST be unique)
  name: ranger

  # The display item of the skill tree for GUIs
  display_item_script: impl_skillTree_ranger_icon

  # Tags that will be checked to see if a player can have this skill tree
  requirements:
  - "<player.has_flag[class]>"
  - "<player.flag[class].equals[Ranger]>"

  # Base command to use Skills from this Skill Tree
  # Command Script MUST be made in this file
  base_command: ranger

impl_skillTree_ranger_icon:
  type: item
  material: feather
  display name: "<&a>Ranger Skills"
  lore:
  - "<&a>Skills for the Ranger Class"
  mechanisms:
    custom_model_data: 2