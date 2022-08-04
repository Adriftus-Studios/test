map_command:
  type: command
  debug: false
  name: map
  description: View the World Map
  usage: /map
  script:
    - narrate "<element[<&color[#000001]>------------------------<&nl><&6>Click me to open the Dynmap<&nl><&color[#000001]>------------------------].on_click[maps.adriftus.net].type[OPEN_URL]>"