mask_ender_wizard:
  type: item
  debug: false
  material: end_crystal
  display name: <&d>Ender Wizard Mask
  lore:
  - "<&e>Take on an alternative appearance"
  - "<&e>While wearing this, you are disguised"
  data:
    name: <&d>Ender Wizard
    type: skin
    skin_blob: ewogICJ0aW1lc3RhbXAiIDogMTYzNjQ3MDc5MzY4NywKICAicHJvZmlsZUlkIiA6ICIwNTVhOTk2NTk2M2E0YjRmOGMwMjRmMTJmNDFkMmNmMiIsCiAgInByb2ZpbGVOYW1lIiA6ICJUaGVWb3hlbGxlIiwKICAic2lnbmF0dXJlUmVxdWlyZWQiIDogdHJ1ZSwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2Q0ZjdmYTA3YTdlOWY1NzU2ZWMxNGQ0YjUyYmIzNzk5ZjE2N2JkMTgxNjE2YmM5ODQ5ZmI5NGVkZjk1MTFmZjYiLAogICAgICAibWV0YWRhdGEiIDogewogICAgICAgICJtb2RlbCIgOiAic2xpbSIKICAgICAgfQogICAgfQogIH0KfQ==;BnPptUMoz6YAK1UVzGOipaY4a7U28aBhazRO5U7pToBuwMuH2b669AFM0T+/0d0LnmbzzHICFXv0npg+1NEoaCFfWf71koXXfJD/8lnO+ePlIWah7RrWWhha5gYY1UsUggGz7LJeUpieIqFIvRj+ZCF4Tu0nCSrN7O3FftVWWTyhL7CbxXhzlZ21MRwh2SfTDK+F4KdlUA5xfO5X+QL1RO6dSLZ91YHbf1xpkbJO5kxEmLDk77H5aoAUpM7us+FiKsxHDOLzRn6Cqmo4DvueONjWlK4jKuQciu0xDaeopZAgUJqojkdLzb2RGZfMTRmsUSP6g7TF9y1clJnjm165NnwlHG025ZOr0CLdOi/4HJHEHe+ug3h6P0RfKnszUae8flocQlt1vimgt71GgxGvQfdNs2DAKCA/5LeZXT9BZqbHf7AuTZ/KK0t6aSp1xgqETDCaOdgEnyclDQcg0LpV2elSPjyqOgT7A89F8LTAFAxxFrAKj2+BtM83C6BeGiFaAJowyqchDUQbfRhc04g9M8iTtSmacIj6bzLBeBRXjeR4Mqzdx1hfhUXXMzO2J9MMyx0/qOrtgbjDhV6iHyBihrNO3yjkcLJp3rfJa/1tVsvXbhSoGdCAFEuiDH3FGyQi0vzqazdedkLT7d8YnnkDQ0UvX6qfraRwsk1MzvZKYsM=
  flags:
    hat: true
    mask: true


mask_wear:
  type: world
  debug: false
  events:
    after player joins:
      - team name:<player.name.substring[0,16]> add:<player.name>
      - team name:<player.name.substring[0,16]> option:NAME_TAG_VISIBILITY status:ALWAYS
      - if !<player.equipment.get[4].has_flag[mask]>:
        - flag player defaults.skin_blob:<player.skin_blob>
        - flag player defaults.display_name:<player.display_name>
    on player equips item_flagged:mask:
      - define script <context.new_item.script>
      - team name:<player.name.substring[0,16]> option:NAME_TAG_VISIBILITY status:FOR_OTHER_TEAMS
      - if !<player.equipment.get[4].has_flag[mask]>:
        - flag player defaults.display_name:<player.display_name>
      - adjust <player> display_name:<[script].parsed_key[data.name]>
      - adjust <player> player_list_name:<[script].parsed_key[data.name]>
      - if <[script].parsed_key[data.type]> == skin:
        - adjust <player> skin_blob:<[script].parsed_key[data.skin_blob]>
    on player unequips item_flagged:mask:
      - define script <context.old_item.script>
      - team name:<player.name.substring[0,16]> option:NAME_TAG_VISIBILITY status:ALWAYS
      - adjust <player> display_name:<player.flag[defaults.display_name]>
      - adjust <player> player_list_name:<player.flag[defaults.display_name]>
      - if <[script].parsed_key[data.type]> == skin:
        - adjust <player> skin_blob:<player.flag[defaults.skin_blob]>
    on player right clicks block with:item_flagged:mask BUKKIT_PRIORITY:HIGHEST:
      - determine cancelled
