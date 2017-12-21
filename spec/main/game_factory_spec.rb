require 'spec_helper'

describe GameFactory do
    
    before do
        @game_factory = GameFactory.new
    end
    
    it "test returned type" do
        minesweeper = @game_factory.new_minesweeper_game(5, 8, 3)
        expect(minesweeper.instance_of? GameBuilder).to eq true
    end
    
    it "test input" do
        minesweeper = @game_factory.new_minesweeper_game(150, 150, 200)
        expect(minesweeper.get_width).to eq 8
        expect(minesweeper.get_height).to eq 8
        expect(minesweeper.get_num_bombs).to eq 64/3
    end
end
