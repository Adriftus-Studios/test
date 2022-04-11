impl_skill_pull_items:
  type: data
  # Internal Name MUST BE UNIQUE
  name: pull_items

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_pull_items_icon

  # Skill Tree (uses internal name)
  skill_tree: mage

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 10s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_pull_items_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player.cursor_on[30].find_entities[dropped_item].within[5]>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_pull_items_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Pull Items"
  lore:
  - "<&b>pull distant items to you"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_pull_items_task:
  type: task
  debug: false
  definitions: targets
  script:
    - determine passively true
    - adjust <[targets]> gravity:false
    - define targets <[targets].as_list> if:<[targets].object_type.equals[LIST].not>
    - while <[targets].filter[is_spawned].size> > 0 && <player.is_online> && <player.is_spawned>:
      - foreach <[targets]> as:target:
        - define vector <player.location.sub[<[target].eye_location>].normalize>
        - adjust <[target]> velocity:<[vector].normalize>
        - wait 5t
    - adjust <[targets].filter[is_spawned]> gravity:true
    - inventory update
