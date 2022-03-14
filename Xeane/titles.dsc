titles_equip:
  type: task
  debug: false
  definitions: title_id
  script:
    - define title_id <context.item.flag[cosmetic].if_null[default]> if:<[title_id].exists.not>
    - define map <map[titles.current=<context.item.flag[title]>;titles.current_tag=<yaml[titles].read[titles.<context.item.flag[title]>.tag].parse_color>]>
    - run global_player_data_modify_multiple def:<player.uuid>|<[map]>

titles_unlock:
  type: task
  debug: false
  definitions: title_id
  script:
    - if <yaml[titles].contains[titles.<[title_id]>]> && !<yaml[global.player.<player.uuid>].contains[titles.unlocked.<[title_id]>]>:
      - run global_player_data_modify def:<player.uuid>|titles.unlocked.<[title_id]>|true

titles_remove:
  type: task
  debug: false
  definitions: title_id
  script:
    - define title_id <context.item.flag[cosmetic].if_null[default]> if:<[title_id].exists.not>
    - run global_player_data_modify def:<player.uuid>|titles.current|!

titles_initialize:
  type: world
  debug: false
  load_yaml:
    - if <yaml.list.contains[titles]>:
      - yaml id:titles unload
    - if <server.has_file[data/global/network/titles.yml]>:
      - ~yaml id:titles load:data/global/network/titles.yml
  events:
    on server start:
      - inject locally path:load_yaml
    on reload scripts:
      - yaml id:titles unload
      - inject locally path:load_yaml