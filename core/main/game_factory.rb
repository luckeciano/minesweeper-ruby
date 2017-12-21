#GameFactory: creational pattern for generating game
#builders. Useful when it's necessary build lots of
#games inside a platform, just passing a param_list
#
#Author:: Luckeciano (mailto:luckeciano@gmail.com)

require_relative 'game_builder'
class GameFactory
    
    #Default Constructor
    def initialize()
    end
    
    #Generates a minesweeper game object
    def new_minesweeper_game(width, height, num_bombs)
        width, height, num_bombs = check_input(width, height, num_bombs)
        param_list = {:width => width, :height => height, :num_bombs => num_bombs}
        return GameBuilder.new("Minesweeper", param_list)
    end
    
    #Checks the user input and modify if it's outside of permitted range
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
        