require_relative '../../core/main/game_factory.rb'
require_relative '../../core/view/minesweeper_board_view.rb'
require_relative '../../core/view/minesweeper_list_view.rb'

def end_to_end()
    width, height, num_mines = 10, 20, 50
    game_factory = GameFactory.new
    minesweeper = game_factory.new_minesweeper_game(width, height, num_mines)
   
   
    while minesweeper.still_playing?
        x, y = rand(width), rand(height)
        valid_move = minesweeper.play(x, y)
        if valid_move
            puts 'Played on ' << x.to_s << " " << y.to_s
        end
        x, y = rand(width), rand(height)    
        valid_flag = minesweeper.flag(x, y)
        if valid_flag
            puts 'Flagged on ' << x.to_s << " " << y.to_s
        end
        if valid_move or valid_flag
            game_view = (rand > 0.5) ? MinesweeperBoardView.new : MinesweeperListView.new
            minesweeper.set_view(game_view)
            minesweeper.board_state()
        end
    end
        
    puts "Fim do jogo!"
    if minesweeper.victory?
      puts "Você venceu!"
    else
      puts "Você perdeu! As minas eram:"
      minesweeper.set_view(MinesweeperBoardView.new)
      minesweeper.board_state(true)
    end
end

end_to_end()