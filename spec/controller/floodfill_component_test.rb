#Floodfill component test:
#test for evaluate floodfill behavior
#
#Author:: Luckeciano(mailto:luckeciano@gmail.com)

require_relative '../../core/controller/minesweeper_controller.rb'
require_relative '../../core/model/minesweeper_model.rb'
require_relative '../../core/view/minesweeper_board_view.rb'

def floodfill_component_test()
    width, height, num_bombs = 10, 10, 7
    model = MinesweeperModel.new(width, height, num_bombs)
    controller = MinesweeperController.new
    game_view = MinesweeperBoardView.new
    
    x = rand(0...width)
    y = rand(0...height)
    
    puts 'Initial Board, with xray'
    
    game_view.print_model_state(model, controller.still_playing, true)
    
    
    puts 'Playing in ' << x.to_s << " " << y.to_s
    
    controller.play(model, x, y)
    game_view.print_model_state(model, controller.still_playing)
    
    puts 'Same board, with xray'
    game_view.print_model_state(model, controller.still_playing, true)
    
end

floodfill_component_test()