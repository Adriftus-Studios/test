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

impl_skillTree_rogue_events:
  type: world
  debug: false
  events:
    on player breaks *log:
      - foreach <context.location.find_players_within[36].filter[has_flag[class.ranger]]> as:__player:
        - run skill_core_lose_experience def:ranger|1
        - narrate "<&c>You have lost 1 XP due to nearby nature damage"
    on plant grows from bonemeal flagged:class.ranger:
      - run skill_core_gain_experience def:ranger|1
