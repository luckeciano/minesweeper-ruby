require_relative 'model_interface'
require 'set'
class MinesweeperModel < ModelInterface
    #OBS: State = [Element, isKnow], where Element = {'F', '#', ' '}
    def initialize(width, height, num_bombs)
        @width, @height = width, height
        @board = Array.new(width) {Array.new(height, '.')}
        @bombs = generate_bombs(width, height, num_bombs)
    end
    
    def fill_state(state, row, column)
        @board[row][column] = state
    end
    
    def get_width
        return @width
    end
        
    def get_height
        return @height
    end
        
    def get_state(row, column)
        return @board[row][column]
    end
    
    def get_board()
        return @board
    end
    
    def get_bombs()
        return @bombs
    end
    
    def get_flags()
        flags = []
        @board.each_with_index do |x, xi|
          x.each_with_index do |y, yi|
            if @board[xi][yi][0] == 'F'
                flags.push([xi, yi])
            end
          end
        end 
        return flags
    end
    
    def get_unknown_cells()
        unk_cells = []
        @board.each_with_index do |x, xi|
          x.each_with_index do |y, yi|
            if @board[xi][yi][0] == '.'
                unk_cells.push([xi, yi])
            end
          end
        end 
        return unk_cells
    end
    
    def get_clear_cells()
        clr_cells = []
        @board.each_with_index do |x, xi|
          x.each_with_index do |y, yi|
            if @board[xi][yi][0] == ' '
                clr_cells.push([xi, yi])
            end
          end
        end 
        return clr_cells 
    end
    
    def board_state (controller, xray = false)
        if xray && controller.is_still_playing()
            final_board = fill_bombs_in_board()
            return final_board
        else return @board
        end
    end
            
    
    def generate_bombs(width, height, num_bombs)
        bombs = Set.new()
        while bombs.length < num_bombs
            x = rand(0...width)
            y = rand(0...height)
            bombs.add([x,y])
        end
        return bombs
    end
    
    private :generate_bombs
        
end
