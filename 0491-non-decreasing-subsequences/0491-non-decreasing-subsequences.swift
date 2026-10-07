class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        
        func backtrack(_ start: Int) {
            if path.count >= 2 {
                result.append(path)
            }
            
            var used = Set<Int>()
            
            for i in start..<nums.count {
                
                // Skip duplicate values at this recursion level
                if used.contains(nums[i]) {
                    continue
                }
                
                // Must be non-decreasing
                if !path.isEmpty && nums[i] < path.last! {
                    continue
                }
                
                used.insert(nums[i])
                path.append(nums[i])
                
                backtrack(i + 1)
                
                path.removeLast()
            }
        }
        
        backtrack(0)
        
        return result
    }
}