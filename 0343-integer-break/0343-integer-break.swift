class Solution {
    func integerBreak(_ n: Int) -> Int {
        
        if n == 2 {
            return 1
        }
        
        var dp = Array(repeating: 0, count: n + 1)
        dp[2] = 1
        
        for i in 3...n {
            
            for j in 1..<i {
                
                let noBreak = j * (i - j)
                let breakAgain = j * dp[i - j]
                
                dp[i] = max(dp[i], noBreak, breakAgain)
            }
        }
        
        return dp[n]
    }
}