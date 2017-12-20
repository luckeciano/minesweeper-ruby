require_relative '../../core/view/minesweeper_board_view.rb'
require_relative '../../core/model/minesweeper_model.rb'
require_relative '../../core/view/minesweeper_list_view.rb'

def initialize_and_print_board_test()
    puts 'Test: Initialize and Print Board'
    game_view = MinesweeperBoardView.new
    width, height = 5 , 8
    board = Array.new(width) {Array.new(height)}
    board[2][5] = 'F'
    board[3][1] = '.'
    board[0][0] = '#'
    game_view.print_board(board, width)
    
end


def initialize_and_print_list_test()
    puts 'Test: Initialize and Print List'
    game_view = MinesweeperListView.new
    model = MinesweeperModel.new(5, 8)
    model.fill_state('F', 2, 5)
    model.fill_state('.', 3, 1)
    model.fill_state('#', 0, 0)
    model.fill_state('#', 3, 7)
    
    game_view.print_list(model.get_bombs, model.get_flags, model.get_unknown_cells, model.get_clear_cells)
end
    

initialize_and_print_board_test()

initialize_and_print_list_test()
