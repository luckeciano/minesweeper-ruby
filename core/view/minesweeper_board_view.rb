require_relative 'view_interface'

class MinesweeperBoardView < ViewInterface
    
    def initialize()
    end
    
    def print_model_state(model, still_playing, xray = false)
        arr = model.board_state(still_playing, xray)
        print_board(arr)
        
    end
    
    def print_board (arr)
        puts arr.map { |a| a.map { |i| i.to_s.rjust(3) }.join }
    end
        
end
    