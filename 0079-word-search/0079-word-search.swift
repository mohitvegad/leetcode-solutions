class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)

        let rows = board.count
        let cols = board[0].count

        func dfs(_ row: Int, _ col: Int, _ index: Int) -> Bool {

            if index == word.count {
                return true
            }

            if row < 0 || row >= rows ||
               col < 0 || col >= cols {
                return false
            }

            // Wrong character
            if board[row][col] != word[index] {
                return false
            }

            // Mark as visited
            let original = board[row][col]
            board[row][col] = "#"

            let found =
                dfs(row - 1, col, index + 1) ||   // up
                dfs(row + 1, col, index + 1) ||   // down
                dfs(row, col - 1, index + 1) ||   // left
                dfs(row, col + 1, index + 1)      // right

            board[row][col] = original

            return found
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if dfs(row, col, 0) {
                    return true
                }
            }
        }

        return false
    }
}