require 'app/game.rb'
require 'app/proc_gen.rb'

class MyGame < Game

    def initialize args
        super

        dragon_type = args.state.dragon_type || :forest

        @lair = ProcGen.build_lair(dragon_type)

        @location = :hoard
        @hoard_items = []

        setup_global
        setup_hoard
    end

    #-------------------------------
    # Globals
    # Stuff that exists and happens everywhere
    #-------------------------------

    def setup_global
        create_log(:log, 300, 10, 680, 270)

        set_resource :reputation, 0
        set_resource :energy, 100
        set_resource :hoard_size, 0, show: false
        set_resource :gold, 0
        set_resource :gems, 0, show: false
        set_resource :max_gold, 1000, show: false
        set_resource :max_followers, 1, show: false

        # create_actor :energy, ticks_total=120, location=:hoard
    end

    #-------------------------------
    # Hoard
    # A simple cave where you can scratch the walls for more space and to find treasure
    #-------------------------------
    def setup_hoard
        create_button :scratch, 600, 500, "Scratch"
        @buttons[:scratch].location =  [:hoard]
        highlight_button :scratch, 0
        auto_highlight :scratch, 100, 100
        reveal_button :scratch

        #create_actor :hoard_ambient, ticks_total = (600 + rand(120)), location=:hoard
    end

    def hoard_ambient_trigger
        add_message :log, @lair.hoard.hoard_messages.sample(), @lair.hoard.ambient_color

        restart_actor :hoard_ambient, ticks_total = (600 + rand(120))
    end

    def scratch_clicked
        # Scratch at the cave walls
        # - Gain Gold
        # - Expand Hoard Space

        if button_highlight_full?(:scratch)
            if use_resource(:energy, 9 + rand(4))
                f = ProcGen.get_find(@lair.hoard, :common)
                gold_limit = get_resource(:max_gold)
                if get_resource(:gold) >= gold_limit
                  add_message :log, "Your treasury is too full to add more treasure to it."
                else
                  add_message :log, f.message
                  generate_resource :gold, f.value.floor.clamp(1,50), limit: gold_limit
                end

                generate_resource :hoard_size, 1 + (rand < 0.2 ? 1 : 0)  # increase hoard size slightly

                auto_highlight :scratch, 100, [100 - get_resource(:gems), 30].max
                restart_highlight :scratch, 0
            else
                add_message :log, "You're far too tired to do that right now."
            end

            #if not unlocked?(:gems) and get_resource(:gold) > 25
            #    unlock(:gems)
            #end

            if not unlocked?(:artifacts) and get_resource(:gems) > 25
                unlock(:artifacts)
            end
        end
    end
end
