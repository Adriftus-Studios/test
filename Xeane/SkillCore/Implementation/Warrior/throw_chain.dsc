impl_skill_throw_chain:
  type: data
  # Internal Name MUST BE UNIQUE
  name: throw_chain

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_throw_chain_icon

  # Skill Tree (uses internal name)
  skill_tree: warrior

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 10s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_throw_chain_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Can you use this in combat
  pvp_usable: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_throw_chain_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Throw Chain"
  lore:
  - "<&b>Throws a Chain Anchor"
  - "<&e>Unfurls a chain to the ground"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_throw_chain_task:
  type: task
  debug: false
  definitions: targets
  script:
    - shoot arrow speed:5 script:impl_skill_throw_chain_task_unfurl

impl_skill_throw_chain_task_unfurl:
  type: task
  debug: false
  definitions: location
  script:
    - if <[location].material.name> == air:
      - modifyblock <[location]> chain[direction=Y]
      - repeat 64:
        - define location <[location].below>
        - if <[location].material.name> != air:
          - repeat stop
        - modifyblock <[location]> chain[direction=Y]
        - wait 4t
