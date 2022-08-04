map_command:
  type: command
  debug: false
  name: map
  description: View the World Map
  usage: /map
  script:
    - narrate "<element[<element[#000001]>------------<&nl><&6>Click me to open the Dynmap<&nl><element[#000001]>------------].on_click[maps.adriftus.net].type[OPEN_URL]>"