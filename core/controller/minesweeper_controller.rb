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
        if model.has_flag(x, y) || model.has_clear_cell(x, y)
            return false
        elsif model.has_bomb(x, y)
            @still_playing = false
            @victory = false
        else
            floodfill(x, y, model)
        end
        check_game_state(model)
        return true
    end
    
    def still_playing
        @still_playing
    end
    
    def set_play_mode(new_mode)
        @still_playing = new_mode
    end
    
    def is_victory
        @victory
    end
    
    def put_flag(model, x, y)
        if @still_playing == false
            return false
        end
        if model.has_unknown_cell(x, y)
            model.fill_state(State::FLAG_CELL, x, y)
            return true
        elsif model.has_flag(x, y)
            model.fill_state(State::UNKNOWN_CELL, x, y)
            return true
        else
            return false
        end
    end
    
    
    def floodfill(x, y, model)
        if x < 0 || x >= model.get_width || y < 0 || y >= model.get_height
            return
        end
        if model.has_flag(x, y) || model.has_bomb(x, y) || model.has_clear_cell(x, y)
            return
        end
        neighbours = calculate_neighbours(x, y, model)
        if neighbours == 0
            model.fill_state(State::CLEAR_CELL, x, y)
        else
            model.fill_state(neighbours.to_s, x, y)
            return
        end
        for i in (-1..1)
            for j in (-1..1)
                if i != 0 || j != 0
                    floodfill(x + i, y + j, model)
                end
            end
        end
    end
    
    def calculate_neighbours(x, y, model)
        bombs = 0
        for i in (-1..1)
            for j in (-1..1)
                if i != 0 || j != 0
                    if model.has_bomb(x + i, y + j)
                        bombs = bombs + 1
                    end
                end
            end
        end
        return bombs
    end
        
    
    def check_game_state(model)
        if model.get_unknown_cells == model.get_bombs
            @still_playing = false
            @victory = true
        end
    end
    
    private :check_game_state, :calculate_neighbours
end
