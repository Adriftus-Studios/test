storm_entity:
    type: entity
    entity_type: drowned
    mechanisms:
        custom_name: <aqua>Storm Entity
        custom_name_visible: true

storm_entity_disguise:
    type: world
    debug: false
    events:
        after storm_entity added to world:
            - wait 1t
            - disguise <context.entity> global as:<entity[player].with_single[skin_blob=ewogICJ0aW1lc3RhbXAiIDogMTY2MjQxOTgxOTU4NywKICAicHJvZmlsZUlkIiA6ICI5NTdiZmY2OThiZDY0YmFiOTRlOGUyZWMxNDY0ZTNhYiIsCiAgInByb2ZpbGVOYW1lIiA6ICJHdWFuR3Jvb3ZlIiwKICAic2lnbmF0dXJlUmVxdWlyZWQiIDogdHJ1ZSwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2NlN2JhMTJjOGIwMmRkOTMwZTE1NTA1ZjBkZjYzN2RlNzJlNTViZjJlMmVhYzU5NjE3NDI5YTg2ZTg4MWY3YTciCiAgICB9CiAgfQp9;Ism5FTveMEYxny2S7ZP56uuIGxM01+G7pedBUe3CCaslqgDikMKk8Xi+IrmjLRCScjgcRTw2EuUgCrI5p3U5dy+oa7LLtQ/Y0dkeOD0B/rardLZmeZafG0NFqbdjE8hj3ftJtR+6XynYR2QqtQt9awBhUAxJBgCHHJ5KU/xWmVPsfq7VFj2/eMe4G8A0EMjqwridYQ2ptiX6sWf7fykAXDICgxWbrlj7ldXPKR4Waj2wlpuSC80dCbMrbImLDdQmVs2daTXVxfa21znmxaTlOqE7DBU2R0RkCgn6tD1UonPv3Zf7jK/E7yDVXpVYf/gEGo0RRhw9H+Us9KQLr74k4jgs81iCCk4it3fE7XIIzzOxWIHsukWJ+U/mgbu/Jp1nkTw4qeNHQ8t1d9YSlUJpoXHgZ+RuKMPKqSCbmrTxwt1Cej26CeNjREGPNmeIxaTyCsJgbqIV8d6eY4LmqnKoguIBlVTYCBDRtmNcAL1DAwv4+89yUOUe+Wl6wUtqQqKbndc/BLjhpY5jF1at+5dIoeQ3A2njfSuWrqB8xQslmtYTnGC1hI1C0HtC1jpQH2sC6DH25WgPIqJu6U50TRoNwM74iQqMPZF8dMjCqiDeWtwOgTa7SXIsq4oG8488fC+tohpsfppVjAd+JMXiIF4ffYJYLcTOGybfma56z4/kc5I=]>
