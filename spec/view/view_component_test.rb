require_relative '../../core/view/minesweeper_board_view.rb'
require_relative '../../core/model/minesweeper_model.rb'
require_relative '../../core/view/minesweeper_list_view.rb'

def initialize_and_print_board_test()
    puts 'Test: Initialize and Print Board'
    game_view = MinesweeperBoardView.new
    model = MinesweeperModel.new(5, 8, 3)
    model.fill_state(State::FLAG_CELL, 2, 5)
    model.fill_state(State::UNKNOWN_CELL, 3, 1)
    model.fill_state(State::FLAG_CELL, 0, 0)
    model.fill_state(State::UNKNOWN_CELL, 3, 7)
    game_view.print_board(model.get_board, model.get_width)
    
end


def initialize_and_print_list_test()
    puts 'Test: Initialize and Print List'
    game_view = MinesweeperListView.new
    model = MinesweeperModel.new(5, 8, 3)
    model.fill_state(State::FLAG_CELL, 2, 5)
    model.fill_state(State::UNKNOWN_CELL, 3, 1)
    model.fill_state(State::FLAG_CELL, 0, 0)
    model.fill_state(State::UNKNOWN_CELL, 3, 7)
    
    game_view.print_model_state(model)
end
    

initialize_and_print_board_test()

initialize_and_print_list_test()