require_relative 'view_interface'

class MinesweeperListView < ViewInterface
    
    def initialize()
    end
    
    def print_model_state(model)
        arr = model.get_board()
        print_list(model.get_bombs, model.get_flags, model.get_unknown_cells, model.get_clear_cells)
    end
    
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
    