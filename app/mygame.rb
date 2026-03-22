require 'app/game.rb'
require 'app/proc_gen.rb'

class MyGame < Game

    def initialize args
        super

        @location = :beginning
        @hoard_items = []

        setup_global
        setup_beginning
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

        create_actor :energy, ticks_total=120, always_tick=true
    end

    def actor_trigger  # Experimental
        restart_actor :energy
        if get_resource(:energy) < 100
            generate_resource :energy
        end
    end

    #-------------------------------
    # Beginning
    # A simple cave where you can scratch the walls for more space and to find treasure
    #-------------------------------
    def setup_beginning
        create_button :scratch, 600, 500, "Scratch"
        @buttons[:scratch].location =  [:beginning]
        highlight_button :scratch, 0
        auto_highlight :scratch, 100, 20
        reveal_button :scratch

        create_button :nap, 600, 300, "Nap"
        @buttons[:nap].location =  [:beginning]
        highlight_button :nap, 100
        reveal_button :nap
    end

    def scratch_tick
        #Button auto highlights so we don't need this _yet_.
    end

    def scratch_clicked
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
        # For now, it's isntantaneous
        NAP_MESSAGES = [
            "You curl protectively around your hoard.",
            "The gold beneath you radiates a comforting warmth.",
            "You settle into the familiar weight of your treasure.",
            "Coins shift softly as you relax.",
            "Your breathing slows as you rest atop your hoard."
        ]

        add_message :log, NAP_MESSAGES.sample()
        set_resource :energy, 100
    end

end

