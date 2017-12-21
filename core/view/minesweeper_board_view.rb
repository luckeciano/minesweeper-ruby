#Minesweeper "Board View": the standard
#visualization of minesweeper
#prints the board in matrix view
#
#Author:: Luckeciano(mailto:luckeciano@gmail.com)

require_relative 'view_interface'

class MinesweeperBoardView < ViewInterface
    
    def initialize()
    end
    
    #Methor from ViewInterface implemented for board view
    def print_model_state(model, still_playing, xray = false)
        arr = model.board_state(still_playing, xray)
        print_board(arr)
        
    end
    
    #Auxiliar function for board printing
    def print_board (arr)
        puts arr.map { |a| a.map { |i| i.to_s.rjust(3) }.join }
    end
        
end
    