# Cancel collisions of projectiles with the projectile_pierce flag
# Projectiles should still add hit entities to its hit_entities definition
# Should be moved into global abstract flags
#projectile_pierce_event:
#  type: world
#  events:
#    on entity_flagged:projectile_pierce collides with entity:
#      - determine passively cancelled
