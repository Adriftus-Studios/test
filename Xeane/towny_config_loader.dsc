town_config_loader:
  type: world
  debug: false
  load_config:
    - if <server.has_file[../Towny/settings/config.yml]>:
      - ~yaml id:towny_config load:../Towny/settings/config.yml
  events:
    on server start:
      - inject locally path:load_config
    on script reload:
      - inject locally path:load_config