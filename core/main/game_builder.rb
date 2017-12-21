#Game Builder: A game builder for games
#based on MVC architecture. It's received
#the name of the game and the param_list, 
#and generate the builder of the game, which is
#the object that the user has access
#
#Author:: Luckeciano(mailto:luckeciano@gmail.com)

require_relative 'game'
require_relative '../view/minesweeper_board_view.rb'
require_relative '../controller/minesweeper_controller.rb'
require_relative '../model/minesweeper_model.rb'


class GameBuilder < Game
    
    #Constructor of Game Builder
    #@game_name: Name of the game
    #@param_list: list of parameters to build up the game object
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
    
    #User Interface for playing the game
    def play(x, y)
        return @controller.play(@model, x, y)
    end
    
    #User interface for flag in the board
    def flag(x, y)
        return @controller.put_flag(@model, x, y)
    end
    
    #User interface to know if game has ended
    def still_playing?()
        return @controller.still_playing
    end
    
    #User interface to know if it was a win
    def victory?()
        return @controller.is_victory
    end
    
    #User interface for board representation
    #@xray: Show the bombs
    def board_state(xray = false)
        return @game_view.print_model_state(@model, @controller.still_playing, xray)
    end
    
    #User interface for change the method of print
    def set_view(new_view)
        @game_view = new_view
    end
    
    
    #getters for testing purposes
    
    
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