module ProcGen

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
                hoard: [:cave],
                outside: [:glacier, :clearing, :hill],
                secondary: [:deep_cave, :mine]
            },
        },
        :desert =>
        {
            description: "",
            biomes: {
                hoard: [:cave],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
            follower_types: [:kobold, :goblin, :princess, :dryad],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
            follower_types: [:kobold, :goblin, :princess],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
            follower_types: [:kobold, :goblin, :princess],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:jewelry, :ring, :amulet, :pearl]
            },
            follower_types: [:merfolk],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
            follower_types: [:kobold, :goblin],
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
            treasure_types: {
                common: [:coin],
                uncommon: [:gem],
                rare: [:wood, :jewelry, :ring, :amulet, :tome]
            },
            follower_types: [:kobold, :goblin],
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
    }

    def self.build_lair type
        terrain = TERRAIN_TYPES[type]
        hoard = BIOMES[terrain.biomes.hoard.sample()]
        outside = BIOMES[terrain.biomes.outside.sample()]

        return {
            hoard: hoard,
            outside: outside,
            discoverable: terrain.biomes.secondary,
            discovered: []
        }
    end

    CONDITIONS = [
        "cracked",
        "weathered",
        "polished",
        "dust-covered",
        "chipped",
        "remarkably well preserved"
    ]

    MATERIALS = [
        "wood",
        "pottery",
        "jade",
        "copper",
        "obsidian",
        "bone"
    ]

    TYPES = [
        "ring",
        "brooch",
        "figurine",
        "coin",
        "idol",
        "amulet",
        "tablet"
    ]

    DETAILS = [
        "depicting a coiled serpent",
        "engraved with tiny runes",
        "bearing a mark of unknown meaning",
        "decorated with spirals and dots",
        "showing a starburst",
        "carved with an all-seeing eye"
    ]

    RULERS = [
        "serpent king",
        "sun priest",
        "obsidian queen",
        "keeper of the gate",
        "lord of the deep halls"
    ]

    DISASTERS = [
        "endless night",
        "the devouring darkness",
        "the silent plague",
        "the cracking earth",
        "the falling sun"
    ]

    RELICS = [
        "the sacred gate",
        "the golden idol",
        "the heart of the mountain",
        "the buried throne",
        "the eternal flame"
    ]

    def self.generate_find
        {
            condition: CONDITIONS.sample,
            material: MATERIALS.sample,
            type: TYPES.sample,
            detail: DETAILS.sample,
            studied: false
        }
    end

    def self.describe_find(find)
        "A #{find[:condition]} #{find[:material]} #{find[:type]} #{find[:detail]}."
    end

    def self.generate_myth
        {
            ruler: RULERS.sample,
            disaster: DISASTERS.sample,
            relic: RELICS.sample
        }
    end

    def self.generate_inscription(myth)
        lines = [
            "The #{myth[:ruler]} sealed away #{myth[:disaster]}.",
            "The #{myth[:ruler]} guarded #{myth[:relic]}.",
            "Only #{myth[:relic]} could stop #{myth[:disaster]}.",
            "When #{myth[:relic]} falls, #{myth[:disaster]} returns.",
            "The priests served the #{myth[:ruler]}.",
            "#{myth[:relic]} lies beneath the temple."
        ]

        lines.sample
    end

    def self.damaged_inscription inscription
        words = inscription.split

        words.map! do |w|
            rand < 0.25 ? "[...]" : w
        end

        words.join(" ")
    end

end
