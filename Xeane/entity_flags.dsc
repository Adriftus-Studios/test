## List of generic flags for entities to use
# no_damage - no damage taken
# no_fall_damage - negates all damage from falling

## You may append _once to any flag above for it to only negate the next time it applies

# no_fly_kick - disable getting "kicked for flying"

entity_flags:
  type: world
  debug: true
  events:
    on entity_flagged:no_fall_damage damaged by FALL:
      - determine cancelled
    on entity_flagged:no_fall_damage_once damaged by FALL:
      - flag <context.entity> no_fall_damage_once:!
      - determine cancelled
    on entity_flagged:no_damage damaged:
      - determine cancelled
    on entity_flagged:no_damage_once damaged:
      - flag <context.entity> invulnerable_once:!
      - determine cancelled
    on player kicked for flying flagged:no_fly_kick:
      - determine passively FLY_COOLDOWN:<player.flag_expiration[no_fly_kick].duration_since[<util.time_now>]>
      - determine cancelled
    on player right clicks entity_flagged:right_click_script:
      - if !<player.is_sneaking>:
        - determine passively cancelled
        - inject <context.entity.flag[right_click_script]>
    on player right clicks entity_flagged:shift_right_click_script:
      - if <player.is_sneaking>:
        - determine passively cancelled
        - inject <context.entity.flag[shift_right_click_script]>
    on material falls:
      - stop if:<context.entity.has_flag[showfake].not>
      - determine passively cancelled
      - showfake <context.entity.fallingblock_material> <context.location> players:<context.location.find_players_within[40]> duration:1m
