require_relative 'game_builder'
class GameFactory
    
    def initialize()
    end
    
    def new_minesweeper_game(width, height, num_bombs)
        width, height, num_bombs = check_input(width, height, num_bombs)
        param_list = {:width => width, :height => height, :num_bombs => num_bombs}
        return GameBuilder.new("Minesweeper", param_list)
    end
    
    def check_input(width, height, num_bombs)
        if width > 100
            width = 8
        end
        if height > 100
            height = 8
        end
        if num_bombs > width*height/3
            num_bombs = width*height/3
        end
        return width, height, num_bombs
    end
    
    private :check_input
end
        