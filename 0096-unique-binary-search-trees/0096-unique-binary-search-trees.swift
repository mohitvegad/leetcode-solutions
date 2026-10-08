class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)

        // 0 nodes 
        dp[0] = 1

        // 1 node 
        if n >= 1 {
            dp[1] = 1
        }

        if n <= 1 {
            return dp[n]
        }

        for nodes in 2...n {
            
            for root in 1...nodes {
                
                let leftNodes = root - 1
                let rightNodes = nodes - root
                
                dp[nodes] += dp[leftNodes] * dp[rightNodes]
            }
        }

        return dp[n]
    }
}