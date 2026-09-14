class Solution {
    
    var result = [[Int]]()
    var current = [Int]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        result = []
        current = []
        
        backtrack(candidates, 0, target)
        
        return result
    }
    
    func backtrack(_ candidates: [Int], _ start: Int, _ remaining: Int) {
        if remaining == 0 {
            result.append(current)
            return
        }
        
        if remaining < 0 {
            return
        }
        
        for i in start..<candidates.count {
            let number = candidates[i]
            
            // Choose
            current.append(number)
            
            // Explore
            backtrack(candidates, i, remaining - number)
            
            // Undo
            current.removeLast()
        }
    }
}