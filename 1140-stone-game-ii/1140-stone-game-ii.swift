class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        
        let n = piles.count
        
        // suffix[i] = total stones from i to the end
        var suffix = Array(repeating: 0, count: n + 1)
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            suffix[i] = suffix[i + 1] + piles[i]
        }
        
        var memo = [String: Int]()
        
        func dfs(_ i: Int, _ m: Int) -> Int {
            
            // No piles remaining
            if i == n {
                return 0
            }
            
            // We can take all remaining piles
            if i + 2 * m >= n {
                return suffix[i]
            }
            
            let key = "\(i)-\(m)"
            
            if let result = memo[key] {
                return result
            }
            
            var best = 0
            
            for x in 1...(2 * m) {
                
                let newM = max(m, x)
                
                let opponent = dfs(
                    i + x,
                    newM
                )
                
                let currentPlayer = suffix[i] - opponent
                
                best = max(
                    best,
                    currentPlayer
                )
            }
            
            memo[key] = best
            
            return best
        }
        
        return dfs(0, 1)
    }
}