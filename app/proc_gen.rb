require 'app/proc_data.rb'

module ProcGen
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

    def self.follower_treasure follower, find
      f = FOLLOWERS[follower]

      {message: f.treasure_messages.sample() % {item: find.description.downcase()}, color: f.message_color}
    end

    def self.build_item type
        features = {}

        type.features.each do |key, list|
            features[key] = list.sample
        end
        action = type.action.sample
        {message: type.template.call(features, action), description: type.description.call(features), value: type.value.call(features)}
    end

    def self.get_find biome, rarity
        treasure = biome[:treasure_types][rarity].sample

        if treasure == :coin
            item = build_item(COIN)
            type = :coin
        elsif treasure == :jewelry
            type = :jewelry
            item = build_item(JEWELRY)
        elsif treasure == :ring
            type = :ring
            item = build_item(RING)
        elsif treasure == :gem
            type = :gem
            value = 1
            message = "A gemstone gleams beneath your claws"
            return {message: message, type: type, value: value}
        else
            type = :artifact
            value = 1
            message = "NOT YET IMPLEMENTED"
            return {message: message, type: type, value: value}
        end
        {message: item.message, description: item.description, type:type, value:item.value}
    end
end
