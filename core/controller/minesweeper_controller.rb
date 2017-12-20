require_relative 'controller_interface'

class MinesweeperController < ControllerInterface
    def initialize()
        @still_playing = true
        @victory = false
    end
    
      
    def play(model, x, y)
        if @still_playing == false
            return false
        end
        board = model.get_board()
        if model.has_flag(x, y) || model.has_clear_cell(x, y)
            return false
        elsif model.has_bomb(x, y)
            @still_playing = false
            @victory = false
            model.finalize_game(x, y)
        else
            @aux = board
            floodfill(x, y)
            model.updateBoard(@aux)
        end
        return true
    end
    
    def still_playing
        return @still_playing
    end
    
    def is_victory
        return @victory
    end
    
    def put_flag(model, x, y)
        if @still_playing == false
            return false
        end
        if model.has_unknown_cell(x, y)
            model.fill_state('F', x, y)
            return true
        elsif model.has_flag(x, y)
            model.fill_state('.', x, y)
            return true
        else
            return false
        end
    end
    
    
    def floodfill(x, y)
    end
end
