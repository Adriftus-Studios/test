impl_skill_sword_spin:
  type: data
  # Internal Name MUST BE UNIQUE
  name: sword_spin

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_sword_spin_icon

  # Skill Tree (uses internal name)
  skill_tree: warrior

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 10s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_sword_spin_task

  # Is the ability harmful? (PvP Action)
  harmful: true

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: true

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player.precise_target[3]>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    damage: 4
    radius: 3

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_sword_spin_icon:
  type: item
  material: feather
  display name: "<&a>Sword Spin"
  lore:
  - "<&b>Damage and knock up any nearby enemies"
  mechanisms:
    custom_model_data: 1


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_sword_spin_task:
  type: task
  debug: false
  definitions: target
  script:
    - hurt <script[impl_skill_sword_spin].parsed_key[balance.damage]> <player.location.find.living_entities.within[3].remove[<player>]> cause:ENTITY_ATTACK source:<player>
    - foreach <player.location.find.living_entities.within[<script[impl_skill_sword_spin].parsed_key[balance.radius]>].remove[<player>]> as:entity:
      - playeffect effect:SWEEP_ATTACK at:<[entity].location> visibility:50 quantity:1 offset:0
      - push <[entity]> destination:<[entity].location.above[2]> no_rotate
    - determine true