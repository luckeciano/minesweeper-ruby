require_relative 'game'
require_relative '../view/minesweeper_board_view.rb'
require_relative '../controller/minesweeper_controller.rb'
require_relative '../model/minesweeper_model.rb'


class GameBuilder < Game
    def initialize(game_name, param_list)
        if game_name == 'Minesweeper'
            @model = MinesweeperModel.new(param_list[:width], param_list[:height], param_list[:num_bombs])
            @controller = MinesweeperController.new
            @game_view = MinesweeperBoardView.new
            @width = param_list[:width]
            @height = param_list[:height]
            @num_bombs = param_list[:num_bombs]
        end
    end
    
    def play(x, y)
        return @controller.play(@model, x, y)
    end
    
    def flag(x, y)
        return @controller.put_flag(@model, x, y)
    end
    
    def still_playing?()
        return @controller.still_playing
    end
    
    def victory?()
        return @controller.is_victory
    end
    
    def board_state(xray = false)
        return @game_view.print_model_state(@model, @controller.still_playing, xray)
    end
    
    def set_view(new_view)
        @game_view = new_view
    end
    
    
    #for test purposes
    def get_height
        return @height
    end
    
    def get_width
        return @width
    end
    
    def get_num_bombs
        return @num_bombs
    end
end