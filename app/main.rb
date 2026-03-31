require 'app/game.rb'
require 'app/mygame.rb'

def init args
    args.state.current = :menu
end


def menu_tick args
    buttons = [
        {:type => :forest, primitives: [
            {x:500, y:500, w:100, h:40, r:164, g:216, b:164}.solid!,
            {x:500, y:500, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:525, w:100, h:40, r:0, g:0, b:0, text: "Forest"}.label!,
        ]},
        {:type => :undersea, primitives: [
            {x:500, y:450, w:100, h:40, r:164, g:196, b:216}.solid!,
            {x:500, y:450, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:475, w:100, h:40, r:0, g:0, b:0, text: "Undersea"}.label!,
        ]},
        {:type => :arctic, primitives: [
            {x:500, y:400, w:100, h:40, r:208, g:208, b:232}.solid!,
            {x:500, y:400, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:425, w:100, h:40, r:0, g:0, b:0, text: "Arctic"}.label!,
        ]},
        {:type => :desert, primitives: [
            {x:500, y:350, w:100, h:40, r:196, g:164, b:128}.solid!,
            {x:500, y:350, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:375, w:100, h:40, r:0, g:0, b:0, text: "Desert"}.label!,
        ]},
        {:type => :volcano, primitives: [
            {x:500, y:300, w:100, h:40, r:196, g:128, b:96}.solid!,
            {x:500, y:300, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:325, w:100, h:40, r:0, g:0, b:0, text: "Volcano"}.label!,
        ]},
        {:type => :mountain, primitives: [
            {x:500, y:250, w:100, h:40, r:164, g:164, b:164}.solid!,
            {x:500, y:250, w:100, h:40, r:0, g:0, b:0}.border!,
            {x:510, y:275, w:100, h:40, r:0, g:0, b:0, text: "Mountain"}.label!,
        ]},
    ]
    args.outputs.primitives << {x:0, y:0, w:1280, h:720, r:128, g:128, b:128}.solid!

    args.outputs.primitives << {x:400, y:600, text: "What sort of dragon are you?", size_px: 28, r:0, g:0, b:0}.label!

    # Render buttons
    buttons.each do |button|
        args.outputs.primitives << button.primitives
    end

    # Check for Button click
    buttons.each do |button|
        if args.inputs.mouse.inside_rect?(button.primitives.first)
            args.outputs.primitives << button.primitives[1].merge({r:255, g:255, b:0})
        end
        if args.inputs.mouse.click and args.inputs.mouse.click.point.inside_rect?(button.primitives.first)
            args.state.dragon_type = button.type
            args.state.game = MyGame.new(args)
            args.state.current = :game
        end
    end

end


def game_tick args


    args.state.game.tick()
    args.state.game.render()
    if not args.state.game.running
        args.outputs.primitives << {x:500, y:350, w:280, h:180, r:128, g:128, b:128}.solid
        args.outputs.primitives << {x:500, y:350, w:280, h:180, r:64, g:64, b:64}.border
        args.outputs.primitives << {x:600, y:450, w:280, h:180, text: "Game Over", r:0, g:0, b:0}.label
        args.outputs.primitives << {x:400, y:400, w:280, h:180, text: "Click or Press Space to Restart", r:0, g:0, b:0}.label
        if args.inputs.mouse.click or args.inputs.keyboard.space
            init(args)
        end
    end
end

def tick args
    if args.state.tick_count == 0
        init args
    end

    if args.state.current == :menu
        menu_tick args
    else
        game_tick args
    end
end
