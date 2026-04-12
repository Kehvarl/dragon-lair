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
        set_resource :hoard_size, 0, show=false
        set_resource :gold, 0
        set_resource :gems, 0, show=false
        set_resource :max_gold, 1000, show=false
        set_resource :max_followers, 1, show=false

        create_actor :energy, ticks_total=120, location=:hoard
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

        create_actor :hoard_ambient, ticks_total = (600 + rand(120)), location=:hoard

        create_button :venture, 600,400, "Venture Forth"
        @buttons[:venture].location =  [:hoard]
        highlight_button :venture, 0
        auto_highlight :venture, 100, (rand(10) + 15) # Predictable, but changes game to game.

        create_actor :venture, ticks_total = 3600, location=:hoard  #60 ticks per second, 2 minutes.
        create_unlock :venture

        create_button :nap, 600, 250, "Nap"
        @buttons[:nap].location =  [:hoard]
        highlight_button :nap, 100
        reveal_button :nap

        create_button :deepen_treasury, 600, 350, "Deepen Treasury"
        @buttons[:deepen_treasury].location =  [:hoard]
        highlight_button :deepen_treasury, 100

        create_button :add_alcove, 600, 300, "Add Alcove"
        @buttons[:add_alcove].location =  [:hoard]
        highlight_button :add_alcove, 100

        create_unlock :gems         # Start finding gems after... ?
        create_unlock :artifacts    # Start finding artifacts after ?

        create_unlock :expand_hoard # When we've first dug out enough space for more gold storage
        create_unlock :add_lair     # When we first can add space for followers
        create_unlock :add_special  # Special Rooms unlock when something happens.

    end

    def hoard_ambient_trigger
        add_message :log, @lair.hoard.hoard_messages.sample(), @lair.hoard.ambient_color

        restart_actor :hoard_ambient, ticks_total = (600 + rand(120))
    end

    #----------------------
    # A Dragon in their hoard regains energy even if not napping
    #----------------------
    def energy_trigger  # Experimental
        restart_actor :energy
        if get_resource(:energy) < 100
            # Energy gain increases with the size of the hoard. +1 for every 10 gold
            # Later we can make gems and unitque artifacts do things
            # Or even shorten the tick time (ticks_total, ticks_remaining)
            generate_resource :energy, 1 + (get_resource(:gold) / 10).floor
        end
    end

    def scratch_tick
        #Button auto highlights so we don't need this _yet_.
    end

    def scratch_clicked
        # Scratch at the cave walls
        # Make the space bigger (We don't track this yet)
        # = More space for treasure
        # = Space for servants or special areas
        # Discover burried treasures
        # = Coins
        # = Gems
        # = Certain types of artifact (metal weapons, rings, magic things)

        if button_highlight_full?(:scratch)
            if use_resource(:energy, 9 + rand(4))
                r = rand
                if r < 0.1 and unlocked?(:artifacts)
                    # No artifacts implemented yet
                elsif r > 0.4 and unlocked?(:gems)
                    # TODO: Properly implement either gems or uncommon finds.
                    f = ProcGen.get_find(@lair.hoard, :uncommon) #Generate then throw away
                    generate_resource :gems # So we find something special, but that just adds some gems?
                    add_message :log, @lair.hoard.scratch_messages.sample() #Replace with Gem messages later
                else
                    f = ProcGen.get_find(@lair.hoard, :common)
                    #TODO: Create a generate_gold helper that generates more gold based on conditions.
                    #Hoard size, time elapsed, something. Or maybe special artifacts.
                    generate_resource :gold, f.value.floor.clamp(1,50), get_resource(:max_gold)
                    add_message :log, f.message
                end

                generate_resource :hoard_size, 1 + (rand < 0.2 ? 1 : 0)  # increase hoard size slightly

                check_hoard_size()

                restart_highlight :scratch, 0
                # Need a way to speed this up over time.  Maybe some more unlocks or actors
                # Or just calculate a faster highlight based on something.
            else
                add_message :log, "You're far too tired to do that right now."
            end

            if not unlocked?(:gems) and get_resource(:gold) > 25
                unlock(:gems)
            end

            if not unlocked?(:artifacts) and get_resource(:gems) > 25
                unlock(:artifacts)
            end
        end
    end

    def check_hoard_size
        # Trigger some unlocks based on size
        # size > expand_size, reveal expand button (increase gold limit)
        # size > venture_size, start venture countdown
        # size > lair_size, reveal/activate Add-Lair button to increase follower limit
        # size > special:  Unlock special rooms (library unlocks Tomes, Museum unlocks artifacts)
    end

    def expand_hoard_unlocked
        # Message about hoard size.  Maybe we hold off until we run close to the gold limit
        # Show Expand_Hoard button
    end

    def add_lair_unlocked
        # Show Add_Lair button to add space for new max_followers
        # Start Follower Random Encounter Timer
    end

    def add_special_unlocked
        # Show Buttons for special rooms (Or just one, or just unlock the ability to reveal them)
        # Library
        # Museum
        # Other.
    end

    def check_reputation
        # Any triggers based of the dragon's reputation (maybe some follower types)
    end

    def gems_unlocked
        # The lair should have a custom unlock message list for this
    end

    def artifacts_unlocked
        # custom list for this too. Maybe we find our first artifact, or set a flag to find one next time we dig
    end

    def nap_clicked
        # Time passes. That should do something.
        # TODO:
        #   Fast-forward time passing.
        #   = This means we need some way to just say "X time passed" instead of simulating every tick
        #   Things that might happen (These all look like agents to me)
        #   = Servants performing chores
        #   = Natural events
        #   = Bandit incursions -- Need to interrupt nap to resolve
        nap_messages = [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ]

        add_message :log, nap_messages.sample()
        set_resource :energy, 100
    end

    def deepen_treasury_clicked
        if use_resource(hoard_size, 10)
            # Increase max gold
        end
    end

    def add_alcove_clicked
        if use_resource(hoard_size, 15)
            # Increase max gold
            # Increase Follower limit
        end
    end


    # One-shot actor set for about 2 minutes.
    def venture_trigger
        if not unlocked?(:venture_50)
            unlock :venture_50
            restart_actor :venture, ticks_remaining = 1800
        elsif not unlocked?(:venture_25)
            unlock :venture_25
            restart_actor :venture
        else
            unlock :venture
        end
    end

    def venture_50_unlocked
        add_message :log, "You feel a restless urge to leave the cave."

    end
    def venture_25_unlocked
        add_message :log, "The air beyond your hoard calls faintly to you."
    end

    def venture_unlocked
        add_message :log, "The desire to explore beyond your cave grows nearly unbearable.  The boulder blocking the entrance is easily removed by your great might, and the fresh air rushes in; brining delightful new scents."
        reveal_button :venture
    end

    def venture_tick
        # We probably don't need this
    end

    def venture_clicked
        # Location :outside
        # Maybe a nice message about what it's like out there.
        add_message :log, "<Not Implemented Yet>"
    end

    #-------------------------------
    # Outside
    # Imediately outside the Hoard
    #-------------------------------

    def setup_outside
        # What shoudl be out here?
    end

    def outside_first_entered
        on_outside_entry("<The message when you first exit the cave")
    end

    def outside_entered
        messages = [
            "<A Return to outside message.  One of several>"
        ]
        on_outside_entry(messages.sample)
    end

    def on_outside_entry message
        add_message(:log, message)
    end

end
