test_tags_profile:
  type: tags_profile
  debug: false
  block:
    climbable:
      ladder: false
      vine: false
      iron_bars: true
      chain: true
      oak_wall_sign: true
      oak_sign: false
      oak_door: true
    mineable/shovel:
      stone: true
      obsidian: true
      gravel: false
    mineable/axe:
      oak_sign: false
  item:
    non_flammable_wood:
      CRIMSON_DOOR: true
      CRIMSON_HYPHAE: false
      CRIMSON_PLANKS: true
  worldgen/biome:
    is_beach:
      SNOWY_BEACH: false
      jungle: true