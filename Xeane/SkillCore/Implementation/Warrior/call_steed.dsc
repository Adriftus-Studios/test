impl_skill_call_steed:
  type: data
  # Internal Name MUST BE UNIQUE
  name: call_steed

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_call_steed_icon

  # Skill Tree (uses internal name)
  skill_tree: warrior

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 1m

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_call_steed_task

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
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    distance: 5

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_call_steed_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Call Steed"
  lore:
  - "<&b>Call a Horse to your side"
  - "<&e>Horse will disappear on despawn"
  - "<&c>Must be in Overworld"
  mechanisms:
    custom_model_data: 7


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_call_steed_task:
  type: task
  debug: false
  definitions: target
  script:
    - if <player.has_flag[warrior.horse]> && <player.flag[warrior.horse].is_spawned>:
      - remove <player.flag[warrior.horse]>
    - spawn horse[persistent=false;owner=<player>] <player.location.forward> save:horse
    - equip <entry[horse].spawned_entity> saddle:saddle
    - flag <player> warrior.horse:<entry[horse].spawned_entity>
    - flag <entry[horse].spawned_entity> on_breed:cancel
    - determine true
