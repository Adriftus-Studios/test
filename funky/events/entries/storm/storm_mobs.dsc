storm_entity:
    type: entity
    entity_type: drowned
    mechanisms:
        custom_name: <aqua>Storm Entity
        custom_name_visible: true
        speed: 0.2

storm_entity_disguise:
    type: world
    debug: false
    events:
        after storm_entity added to world:
            - wait 1t
            - disguise <context.entity> global as:drowned[age=baby]
