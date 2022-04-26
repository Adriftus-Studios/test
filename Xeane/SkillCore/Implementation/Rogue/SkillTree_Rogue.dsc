impl_skilltree_Rogue:
  type: data

  # The internal name of the skill tree (this MUST be unique)
  name: rogue

  # The display item of the skill tree for GUIs
  display_item_script: impl_skillTree_rogue_icon

  # Tags that will be checked to see if a player can have this skill tree
  requirements:
  - "<player.has_flag[class.rogue]>"

  # Base command to use Skills from this Skill Tree
  # Command Script MUST be made in this file
  base_command: rogue

  # Player will be flagged with class.Rogue, while they are a rogue

impl_skillTree_rogue_icon:
  type: item
  material: feather
  display name: "<&a>Rogue Skills"
  lore:
  - "<&a>Skills for the Rogue Class"
  mechanisms:
    custom_model_data: 4

impl_skillTree_rogue_events:
  type: world
  debug: false
  events:
    on player kills villager flagged:class.rogue:
      - run skill_core_gain_experience def:rogue|1
    on player kills illager flagged:class.rogue:
      - run skill_core_lose_experience def:rogue|1