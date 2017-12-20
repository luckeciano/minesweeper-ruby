require 'spec_helper'

describe MinesweeperModel do
    
    before do
        @model = MinesweeperModel.new(5, 8, 3)
        @model.fill_state('F', 3, 1)
        @model.fill_state('.', 3, 3)
        @model.fill_state(' ', 4, 4)
    end
    
    it "test initializer and getters" do
        expect(@model.get_width).to eq 5
        expect(@model.get_height).to eq 8
        expect(@model.get_state(3,1)).to eq 'F'
        expect(@model.get_flags()).to eq [[3, 1]]
        expect(@model.get_bombs().length).to eq 3
        expect(@model.get_unknown_cells().length).to eq 38
        expect(@model.get_clear_cells).to eq [[4,4]]
        arr = Array.new(@model.get_width) {Array.new(@model.get_height, '.')}
        arr[3][1] = 'F'
        arr[3][3] = '.'
        arr[4][4] = ' '
        expect(@model.get_board).to eq arr
    end
end
