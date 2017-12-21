require 'spec_helper'

describe MinesweeperController do
    
    before do
        @controller = MinesweeperController.new
        bombs_list = [[2,2], [3,3], [4,4]]
        @model_stub = MinesweeperModel.new(5, 8, 3,  bombs_list)
    end
    
    it "test initial game state" do
        expect(@controller.still_playing).to eq true
        expect(@controller.is_victory).to eq false
    end
    
    it "put flag when game was finalized" do
        @controller.set_play_mode(false)
        expect(@controller.put_flag(@model_stub,0,0)).to eq false
    end
    
    it "put flag, still playing, in a unknown cell" do
        expect(@controller.put_flag(@model_stub,0,0)).to eq true
        expect(@model_stub.get_state(0,0)).to eq State::FLAG_CELL
    end
    
    it "remove flag, still playing, in a flagged cell" do
        expect(@controller.put_flag(@model_stub,0,0)).to eq true
        expect(@controller.put_flag(@model_stub, 0,0)).to eq true
        expect(@model_stub.get_state(0,0)).to eq State::UNKNOWN_CELL
    end
    
  
    it "play when game was finalized" do
        @controller.set_play_mode(false)
        expect(@controller.play(@model_stub,0,0)).to eq false
    end
    
    it "play in a flagged cell" do
        @controller.put_flag(@model_stub, 3, 1)
        expect(@controller.play(@model_stub,3,1)).to eq false
    end
    
    it "play in a clear cell" do
        @controller.play(@model_stub,3,2)
        expect(@controller.play(@model_stub, 3,2)).to eq false
    end
    
    it "play in a bomb" do
        expect(@controller.play(@model_stub, 2,2)).to eq true
        expect(@controller.still_playing).to eq false
        expect(@controller.is_victory).to eq false
    end
    
    it "floodfill with zero bombs" do
        @controller = MinesweeperController.new
        bombs_list = []
        @model_stub = MinesweeperModel.new(3, 3, 0,bombs_list)
        expect(@controller.play(@model_stub, 0,0)).to eq true
        board = [[State::CLEAR_CELL,State::CLEAR_CELL,State::CLEAR_CELL], [State::CLEAR_CELL,
                State::CLEAR_CELL,State::CLEAR_CELL], [State::CLEAR_CELL,State::CLEAR_CELL,State::CLEAR_CELL]]
        expect(@model_stub.get_board).to eq board
    end
        
    
    it "floodfill with one bomb" do
        @controller = MinesweeperController.new
        bombs_list = [[1,1]]
        @model_stub = MinesweeperModel.new(3, 3, 1, bombs_list)
        expect(@controller.play(@model_stub,0,0)).to eq true
        expect(@controller.play(@model_stub,2,0)).to eq true
        expect(@controller.play(@model_stub,0,2)).to eq true
        expect(@controller.play(@model_stub,2,2)).to eq true
        board = [['1',State::UNKNOWN_CELL,'1'], [State::UNKNOWN_CELL,State::UNKNOWN_CELL,State::UNKNOWN_CELL], 
        ['1',State::UNKNOWN_CELL,'1']]
        expect(@model_stub.get_board).to eq board
    end
        
end
