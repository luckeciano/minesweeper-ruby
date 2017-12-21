require_relative 'game_factory'


def main()
    puts 'Width, height, number of bombs:'
    width, height, number_of_bombs = $stdin.read.split
    puts 'New game with board of ' << width << ', ' << height << ' and ' << number_of_bombs << ' bombs.' 
    
    game_factory = GameFactory.new
    minesweeper = game_factory.new_minesweeper_game(width.to_i, height.to_i, number_of_bombs.to_i)
    
    while minesweeper.still_playing?
        puts 'New turn: play or flag (P or F) and width,height'
        turn, width, height = $stdin.read.split(' ')
        x, y = width.to_i, height.to_i
        if turn == 'P'
            valid_move = minesweeper.play(x, y)
            if valid_move
                puts 'Played on ' << x.to_s << " " << y.to_s
            end
        elsif turn == 'F'
            valid_flag = minesweeper.flag(x, y)
            if valid_flag
                puts 'Flagged on ' << x.to_s << " " << y.to_s
            end
        end
        if valid_move or valid_flag
            minesweeper.board_state()
        end
    end
        
    puts "Fim do jogo!"
    if minesweeper.victory?
      puts "Você venceu!"
    else
      puts "Você perdeu! As minas eram:"
      minesweeper.board_state(true)
    end
    
end

main()