impl_skill_grow_vine:
  type: data
  # Internal Name MUST BE UNIQUE
  name: grow_vine

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_grow_vine_icon

  # Skill Tree (uses internal name)
  skill_tree: ranger

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 5s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_grow_vine_task

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
  - "<player.eye_location.precise_cursor_on[40].if_null[null]>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_grow_vine_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Grow Vine"
  lore:
  - "<&b>Grows a vine from leaves"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_grow_vine_task:
  type: task
  debug: false
  definitions: targets
  script:
    - if !<[targets].material.name.advanced_matches_text[*leaves]>:
      - narrate "<&c>Invalid Target Block"
      - determine false
    - define direction <player.eye_location.precise_impact_normal>
    - define location <player.cursor_on.add[<[direction]>]>
    - if !<[location].material.name.advanced_matches_text[*air]>:
      - narrate "<&c>No room to grow vines here"
      - determine false
    - determine passively true
    - define orientation <[location].sub[<[direction]>]>
    - modifyblock <[location]> vine[faces=<[orientation]>]
    - repeat 64:
      - define location <[location].below>
      - if <[location].material.name> != air:
        - repeat stop
      - modifyblock <[location]> vine[faces=<[orientation]>]
      - wait 4t
