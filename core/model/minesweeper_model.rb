require_relative 'model_interface'
class MinesweeperModel < ModelInterface

    def initialize(width, height)
        @width, @height = width, height
        @board = Array.new(width) {Array.new(height)}
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
        bombs = []
        @board.each_with_index do |x, xi|
          x.each_with_index do |y, yi|
            if @board[xi][yi] == '#'
                bombs.push([xi, yi])
            end
          end
        end 
        
        return bombs
    end
    
    def get_flags()
        flags = []
        @board.each_with_index do |x, xi|
          x.each_with_index do |y, yi|
            if @board[xi][yi] == 'F'
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
            if @board[xi][yi] == '.'
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
            if @board[xi][yi] == ' '
                clr_cells.push([xi, yi])
            end
          end
        end 
        return clr_cells 
    end
        
end
