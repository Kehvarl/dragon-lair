require 'app/game.rb'
require 'app/proc_gen.rb'

class MyGame < Game

    def initialize args
        super

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
        set_resource :gold, 0
        set_resource :gems, 0, show=false

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
        auto_highlight :scratch, 100, 20
        reveal_button :scratch

        create_actor :hoard_ambient, ticks_total = (100 + rand(20)), location=:hoard

        create_button :venture, 600,400, "Venture Forth"
        @buttons[:venture].location =  [:hoard]
        highlight_button :venture, 0
        auto_highlight :venture, 100, (rand(10) + 15) # Predictable, but changes game to game.

        create_actor :venture, ticks_total = 3600, location=:hoard  #60 ticks per second, 2 minutes.
        create_unlock :venture

        create_button :nap, 600, 300, "Nap"
        @buttons[:nap].location =  [:hoard]
        highlight_button :nap, 100
        reveal_button :nap

    end

    def hoard_ambient_trigger
        HOARD_MESSAGES = [
            "The hoard settles softly.",
            "A faint clink echoes through the cave.",
            "The faint glow of your hoard dances on the cave walls",
            "The subteranean sussuration is soothing.",
            "You glance at your hoard and feel the warmth of ownership."
        ]

        # Maybe these get a custom color
        add_message :log, HOARD_MESSAGES.sample()

        restart_actor :hoard_ambient, ticks_total = (100 + rand(20))
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
        SCRATCH_MESSAGES = [
            "You dislodge a coin from the stone.",
            "Your claws scrape against buried metal.",
            "The hoard shifts with a pleasing clink.",
            "Dust and gold scatter beneath your talons.",
            "You uncover something small and valuable."
        ]

        if button_highlight_full?(:scratch)
            if use_resource(:energy, 9 + rand(4))
                generate_resource :gold
                restart_highlight :scratch, 0
                add_message :log, SCRATCH_MESSAGES.sample()
            else
                add_message :log, "You're far too tired to do that right now."
            end
        end
    end

    def nap_clicked
        # Time passes. That should do something.
        # Do we maybe lock the screen and let some stuff happen in the background
        # If the user clicks they interrupt the nap before regaining full energy
        #   We could pause all the buttons
        #   Pop up a message
        #   Show Energy ticking up
        #   Run non-dragon stuff in the background
        #   = Servants performing chores
        #   = Natural events
        #   = Bandit incursions -- Need to interrupt nap to resolve
        #  Do We process this all realtime, or just  check the tables for interruption events,
        #  Then just generate the correct resources and whatnot for the elapsed time
        # For now, it's isntantaneous
        NAP_MESSAGES = [
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ]

        add_message :log, NAP_MESSAGES.sample()
        set_resource :energy, 100
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
        add_message :log, "The desire to expore beyond your cave grows nearly unbearable.  The boulder blockng the entrance is easily removed by your great might, and the fresh air rushes in; brining delightful new scents."
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

