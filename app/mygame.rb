require 'app/game.rb'
require 'app/proc_gen.rb'


# TODO
# Remove NPC follower code, or move that to an NPC Module
# Create Follower resources.  Possibly per follower type
# Create Follower Assignment system:
#   Assign or unassign followers on tasks.
#   Each Task tick, generate based on assigned follower count
#   Do different follower types only do certain tasks or have task bonuses

class MyGame < Game
    def initialize args
        super

        dragon_type = args.state.dragon_type || :forest

        @lair = ProcGen.build_lair(dragon_type)

        @location = :hoard
        @hoard_items = []

        @followers = 0
        @max_followers = 0
        @follower_assignment = {
          gather: 0,
          hunt: 0,
          reputation: 0,
        }

        setup_global
        setup_hoard
    end

    #-------------------------------
    # NPC Subsystem
    # Expands the Actor module with repeatable events representing NPCs performing tasks
    # Currently only generating gold.
    #-------------------------------
    def create_npc (type, ticks_total: 60, location: nil, always_tick: nil, &block)
        @next_actor_id ||= 0
        @next_actor_id += 1
        id = "#{type}_#{@next_actor_id}".to_sym

        create_actor(id, ticks_total: ticks_total, location: location, always_tick: always_tick)

        @actors[id].type = type
        @actors[id].ticks_remaining = rand(ticks_total)
        @actors[id].on_trigger_proc = proc do |game, actor|
          block.call(game, actor)
          actor.ticks_remaining = actor.ticks_total
        end
        id
    end

    #-------------------------------
    # Example of creating multiple NPCs
    #-------------------------------
    def test_npcs count=5
      #create_actor :hoard_ambient, ticks_total = (600 + rand(120)), location=:hoard
      count.times do
        f = @lair.hoard.follower_types.sample()
        follower_data = FOLLOWERS[f]
        create_follower(f, ticks_total: follower_data.speed) do |game, actor|
          found = ProcGen.get_find(@lair.hoard, :common)

          m = ProcGen.follower_treasure(actor.type, found)
          add_message :log, m.message, m.color
          generate_resource :gold, follower_data.gold
        end
      end
    end

    #-------------------------------
    # Followers
    #-------------------------------
    def add_follower
      if @followers < @max_followers
        @followers += 1
      end
    end

    def count_assigned_followers
      total = 0
      @follower_assignment.each do |fa|
        total += @follower_assignment[fa]
      end
      return total
    end

    def assign_follower task
      if @follower_assignment.include?(task) && count_assigned_followers < @followers
        @follower_assignment[task] += 1
      end
    end

    def unassign_follower task
      if @follower_assignment.include?(task) && @follower_assignment[task] > 0
        @follower_assignment[task] -= 1
      end
    end

    def follower_tick
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


    end

    def hoard_ambient_trigger
        add_message :log, @lair.hoard.hoard_messages.sample(), @lair.hoard.ambient_color

        restart_actor :hoard_ambient, ticks_total = (600 + rand(120))
    end

    # TODO
    # Main Game Loop
    # - Dig/Scratch
    #   - Costs energy
    #   - Gain Gold
    #   - Gain Space
    # - Nap
    #   - Recover Energy
    # - Passive
    #   - Energy Regain based on hoard size and prestige
    # - Spend Space on Automation
    #   - Automation generates gold
    # - Spend Gold on Upogrades
    #   - Strengthen Claws: Faster Gold Gain/Dig
    #   - Deepen Treasury: Higher Gold Limit
    def scratch_clicked

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
        end
    end
end
