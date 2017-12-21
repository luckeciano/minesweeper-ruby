#Minesweeper "List View": list 
#visualization of minesweeper
#prints the board in list of states
#
#Author:: Luckeciano(mailto:luckeciano@gmail.com)
require_relative 'view_interface'

class MinesweeperListView < ViewInterface
    
    def initialize()
    end
    
    #View interface method for list view
    def print_model_state(model, still_playing, xray = false)
        bombs = []
        if xray && !still_playing
            bombs = model.get_bombs
        end
        print_list(bombs, model.get_flags, model.get_unknown_cells, model.get_clear_cells)
    end
    
    
    #Auxiliar method for printing
    def print_list (bombs, flags, unknown_cells, clear_cells)
        puts 'Bombs: '
        p bombs
        puts 'Flags: '
        p flags
        puts 'Unknown Cells: '
        p unknown_cells
        puts 'Clear Cells: '
        p clear_cells
    end
        
end
    