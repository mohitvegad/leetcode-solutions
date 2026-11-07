class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        
        let n = grid.count

        var distance = Array(repeating: Array(repeating: 0, count: n), count: n)

        if grid[0][0] == 1 || grid[n-1][n-1] == 1 {
            return -1
        }

        var queue = [(Int, Int)]()
        queue.append((0,0))
        distance[0][0] = 1

        var direction = [(-1,0), (0, 1), (1, 0), (0, -1), (1,1), (-1,1), (1, -1), (-1, -1)]

        while !queue.isEmpty {

            var current = queue.removeFirst()
            var row = current.0
            var col = current.1

            // if row == n - 1 && col == n - 1 {
            //     return distance[row][col]
            // }

            for dir in 0..<direction.count {
                var nr = row + direction[dir].0
                var nc = col + direction[dir].1

                if nr >= 0 && nr < n &&
                   nc >= 0 && nc < n &&
                   grid[nr][nc] == 0 && 
                   distance[nr][nc] == 0 {
                    
                    distance[nr][nc] = distance[row][col] + 1
                    queue.append((nr,nc))

                    }
                }
            }

            return -1
        }
    }