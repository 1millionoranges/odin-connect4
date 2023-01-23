class GameBoard
    @@directions = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
    def self.find_winner(board)
        height = board.size
        width = board[0].size
        for i in (0...height)
            for j in (0...width)
                piece = board[i][j]
                if piece
                    for direction in @@directions
                        winner = true
                        for k in (1..3)
                            y = i + direction[0] * k
                            x = j + direction[1] * k

                            if(!GameBoard.on_board?(board, [y,x]) || board[y][x] != piece)
                                winner = false
                            end
                            
                        end
                        return {direction: direction, pos: [i,j]} if winner
                    end
                end
            end
        end
        return false
    end
    def self.on_board?(board, pos)
        height = board.size
        width = board[0].size
        if (pos[0] < 0 || pos[1] < 0)
            return false
        elsif pos[0] >= height || pos[1] >= width
            return false
        end
        return true
    end
    def self.place_move(board, move_spot, piece)
        if move_spot < 0 || move_spot >= board[0].size
            return false
        end
        if board[0][move_spot]
            return false
        end
        row = 0
        while row < board.size do
            if (row==board.size-1) || board[row + 1][move_spot]
                board[row][move_spot] = piece
                return true
            end
            row += 1
        end
        return false
    end
end

