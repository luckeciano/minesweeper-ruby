module State
    UNKNOWN_CELL = '.'
    CLEAR_CELL = 'O'
    BOMB_CELL = '#'
    FLAG_CELL = 'F'
end

require_relative 'model_interface'
require 'set'
class MinesweeperModel < ModelInterface
    def initialize(width, height, num_bombs, bombs_list = nil)
        @width, @height = width, height
        @board = Array.new(width) {Array.new(height, State::UNKNOWN_CELL)}
        if bombs_list == nil
            @bombs = generate_bombs(width, height, num_bombs)
        else
            @bombs = bombs_list
        end
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
            if @board[xi][yi] == State::FLAG_CELL
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
            if @board[xi][yi] == State::UNKNOWN_CELL
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
            if @board[xi][yi] != State::UNKNOWN_CELL &&
            @board[xi][yi] != State::BOMB_CELL &&
            @board[xi][yi] != State::FLAG_CELL
                clr_cells.push([xi, yi])
            end
          end
        end 
        return clr_cells 
    end
    
    def board_state (still_playing, xray = false)
        if xray && !still_playing
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
    
    def check_input(x, y)
        if x < 0 || x >= @width || y < 0 || y >= @height
            return false
        end
        return true
    end    
    
    
    def has_flag(x, y)
        if check_input(x, y) == false
            return false
        end
        if @board[x][y] == State::FLAG_CELL
            return true
        end
        return false
    end
    
    def has_unknown_cell(x, y)
        if check_input(x, y) == false
            return false
        end
        if @board[x][y] == State::UNKNOWN_CELL
            return true
        end
        return false
    end
    
    def has_clear_cell(x, y)
        if check_input(x, y) == false
            return false
        end
        if @board[x][y] != State::UNKNOWN_CELL &&
            @board[x][y] != State::BOMB_CELL &&
            @board[x][y] != State::FLAG_CELL
            return true
        end
        return false
    end
    
    def has_bomb(x, y)
        return @bombs.include?([x,y])
    end
    
    def update_board(board)
        @board = board
    end
    
    
    def fill_bombs_in_board()
        new_board = @board.map(&:clone)
        @bombs.each do |element|
            x = element[0]
            y = element[1]
            new_board[x][y] = State::BOMB_CELL
        end
        return new_board
    end
    
    private :generate_bombs, :fill_bombs_in_board, :check_input
        
end
