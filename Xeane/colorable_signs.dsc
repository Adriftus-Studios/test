colorable_signs:
  type: world
  debug: false
  events:
    on player changes sign permission:adriftus.sign.color bukkit_priority:LOWEST:
      - determine <context.new.parse_color>
    on player changes sign permission:adriftus.sign.custom_color priority:-1 bukkit_priority:LOWEST:
      - define contents <context.new>
      - define contents <[contents].replace[&z].with[<&color[#010000]>]>
      - define contents <[contents].replace[&y].with[<&color[#000001]>]>
      - define contents <[contents].replace[&x].with[<&color[#000100]>]>
      - determine <[contents]>