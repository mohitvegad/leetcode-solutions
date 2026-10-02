class Solution {
    func uniquePathsWithObstacles(
        _ obstacleGrid: [[Int]]
    ) -> Int {
        
        let rows = obstacleGrid.count
        let columns = obstacleGrid[0].count
        
        var dp = Array(
            repeating: Array(repeating: 0, count: columns),
            count: rows
        )
        
        // Starting cell is blocked
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        
        dp[0][0] = 1
        
        for row in 0..<rows {
            for column in 0..<columns {
                
                if obstacleGrid[row][column] == 1 {
                    dp[row][column] = 0
                    continue
                }
                
                if row > 0 {
                    dp[row][column] += dp[row - 1][column]
                }
                
                if column > 0 {
                    dp[row][column] += dp[row][column - 1]
                }
            }
        }
        
        return dp[rows - 1][columns - 1]
    }
}