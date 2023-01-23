require './lib/game.rb'

test_board = [[nil,nil,nil,nil],
[nil,nil,nil,nil],
[nil,nil,nil,nil],
[1,1,1,1]]

describe GameBoard do
    describe '#check_winner' do
        it "finds a winner" do
            expect(GameBoard.find_winner(test_board)).to eql({direction: [0,1], pos: [3,0]})
        end
        it "Doesn't find a fake winner" do
            test_board[3][0] = nil
            expect(GameBoard.find_winner(test_board)).to eql(false)
        end
    end
    describe '#place_move' do
        it "places a piece in the correct spot" do
            GameBoard.place_move(test_board, 2, 2)
            expect(test_board).to eql([[nil,nil,nil,nil],
            [nil,nil,nil,nil],
            [nil,nil,2,nil],
            [nil,1,1,1]])
        end
        it "does not overfill the board" do
        end
    end

end
    