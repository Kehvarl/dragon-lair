
TERRAIN_TYPES = {
    :forest =>
    {
        description: "",
        biomes: {
            hoard: [:cave],
            outside: [:forest, :clearing, :hill],
            secondary: [:underground_river, :mine]
        },
    },
    :undersea =>
     {
        description: "",
        biomes: {
            hoard: [:undersea_cavern],
            outside: [:seabed, :clearing, :hill],
            secondary: [:underground_river, :mine]
        },
    },
    :arctic =>
    {
        description: "",
        biomes: {
            hoard: [:frozen_cave],
            outside: [:glacier, :clearing, :hill],
            secondary: [:deep_cave, :mine]
        },
    },
    :desert =>
    {
        description: "",
        biomes: {
            hoard: [:desert_cave],
            outside: [:dunes, :clearing, :hill],
            secondary: [:underground_river, :mine]
        },
    },
    :volcano =>
    {
        description: "",
        biomes: {
            hoard: [:lava_cave],
            outside: [:lava_flow, :clearing, :hill],
            secondary: [:underground_river, :mine]
        },
    },
    :mountain =>
    {
        description: "",
        biomes: {
            hoard: [:cave],
            outside: [:forest, :clearing, :hill],
            secondary: [:underground_river, :mine]
        },
    },
}

BIOMES ={
    :cave => {
        ambient_color: { r: 170, g: 200, b: 230 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :forest => {
        ambient_color: { r: 170, g: 230, b: 200 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin, :princess, :dryad],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :clearing => {
        ambient_color: { r: 170, g: 230, b: 230 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin, :princess],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :hill => {
        ambient_color: { r: 170, g: 200, b: 200 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin, :princess],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :underground_river => {
        ambient_color: { r: 150, g: 180, b: 230 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:jewelry, :ring, :pearl]
        },
        follower_types: [:merfolk],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :mine => {
        ambient_color: { r: 200, g: 180, b: 200 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :undersea_cavern => {
        ambient_color: { r: 140, g: 220, b: 240 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "The shifting tide causes the water in your cavern to squeeze you soothingly.",
            "A shoal of fish dart through, their silver scales bringing your attention to your glittering hoard.",
            "The distant poetry of singing whales echoes through the sea.",
            "Tiny bubbles escape your hoard and twinkle in the cavern's light as they rise to the silvery pool of air at the ceiling."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :seabed => {
        ambient_color: { r: 140, g: 220, b: 240 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        follower_types: [:kobold, :goblin],
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "The shifting tide causes the water in your cavern to squeeze you soothingly.",
            "A shoal of fish dart through, their silver scales bringing your attention to your glittering hoard.",
            "The distant poetry of singing whales echoes through the sea.",
            "Tiny bubbles escape your hoard and twinkle in the cavern's light as they rise to the silvery pool of air at the ceiling."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
    },
    :frozen_cave => {
        ambient_color: { r: 170, g: 200, b: 230 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :glacier => {
        ambient_color: { r: 220, g: 220, b: 230 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :desert_cave => {
        ambient_color: { r: 210, g: 200, b: 170 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :dunes => {
        ambient_color: { r: 210, g: 210, b: 170 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :lava_cave => {
        ambient_color: { r: 180, g: 160, b: 100 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
    :lava_flow => {
        ambient_color: { r: 210, g: 200, b: 170 },
        treasure_types: {
            common: [:coin],
            uncommon: [:gem],
            rare: [:wood, :jewelry, :ring, :amulet, :tome]
        },
        nap_messages: [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ],  
        hoard_messages: [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ],
        scratch_messages: [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ],
        follower_types: [:kobold, :goblin],
    },
}

FOLLOWERS = {
    :kobold => {
        :treasure_messages => [
            "",
            "",
            ""
        ],
    },
    :goblin => {
        :treasure_messages => [
            "",
            "",
            ""
        ],
    },
    :princess => {
        :treasure_messages => [
            "",
            "",
            ""
        ],
    },
    :dryad => {
        :treasure_messages => [
            "",
            "",
            ""
        ],
    },
    :merfolk => {
        :treasure_messages => [
            "",
            "",
            ""
        ],
    },
}

COIN = {
    :features => {
        :condition => [
            {condition: "dull", value: 0.5},
            {condition: "broken", value: 0.5},
            {condition: "simple", value: 1.0},
            {condition: "plain", value: 1.0},
            {condition: "fine", value: 1.0},
            {condition: "shiny", value: 1.5},
            {condition: "gleaming", value: 1.5}
        ],
        :material => [
            {material: "tin", value: 0.25},
            {material: "copper", value: 0.5},
            {material: "bronze", value: 1.0},
            {material: "silver", value: 1.25},
            {material: "gold", value: 1.5},
            {material: "platinum", value: 2.0},
        ],
    },
    template: ->(c, action) {
        "A #{c.condition.condition} #{c.material.material} coin #{action}."
    },
    value: ->(c) {
        c.condition.value * c.material.value
    },
    :action => [
        "falls to the floor as you dig.",
        "clinks against your claws.",
        "catches your eye amidst the spoil.",
        "can't escape your keen senses.",
        "drops into your waiting grasp.",
    ]
}

JEWELRY = {
    :features => {
        :condition => [
            {condition: "dull", value: 0.5},
            {condition: "broken", value: 0.5},
            {condition: "simple", value: 1.0},
            {condition: "plain", value: 1.0},
            {condition: "fine", value: 1.0},
            {condition: "shiny", value: 1.5},
            {condition: "gleaming", value: 1.5}
        ],
        :material => [
            {material: "copper", value: 0.5},
            {material: "brass", value: 1.0},
            {material: "silver", value: 1.25},
            {material: "gold", value: 1.5},
            {material: "platinum", value: 2.0},
        ],
        :type => [
            {type: "amulet", value: 1.0},
            {type: "necklace", value: 1.0},
            {type: "broach", value: 1.0},
            {type: "earring", value: 1.0},
            {type: "bracelet", value: 1.0},

        ],
    },
    template: ->(j, action) {
        "A #{j.condition.condition} #{j.material.material} #{j.type.type} #{action}."
    },
    value: ->(j) {
        j.condition.value * j.material.value * j.type.value
    },
    :action => [
        "falls to the floor as you dig.",
        "clinks against your claws.",
        "catches your eye amidst the spoil.",
        "can't escape your keen senses.",
        "drops into your waiting grasp.",
    ]
}

RING = {
    :features => {
        :condition => [
            {condition: "dull", value: 0.5},
            {condition: "broken", value: 0.5},
            {condition: "simple", value: 1.0},
            {condition: "plain", value: 1.0},
            {condition: "fine", value: 1.0},
            {condition: "shiny", value: 1.5},
            {condition: "gleaming", value: 1.5}
        ],
        :material => [
            {material: "copper", value: 0.5},
            {material: "brass", value: 1.0},
            {material: "silver", value: 1.25},
            {material: "gold", value: 1.5},
            {material: "platinum", value: 2.0},
        ],
        :type => [
            {type: "band", value: 1.0},
            {type: "signet", value: 1.0},
            {type: "cameo", value: 1.0},
        ],
    },
    template: ->(r, action) {
        "A #{r.condition.condition} #{r.material.material} #{r.type.type} #{action}."
    },
    value: ->(r) {
        r.condition.value * r.material.value * r.type.value
    },
    :action => [
        "falls to the floor as you dig.",
        "clinks against your claws.",
        "catches your eye amidst the spoil.",
        "can't escape your keen senses.",
        "drops into your waiting grasp.",
    ]
}
