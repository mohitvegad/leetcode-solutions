class Solution {
    func predictTheWinner(_ nums: [Int]) -> Bool {
        
        var memo = [String: Int]()
        
        func dfs(_ left: Int, _ right: Int) -> Int {
            
            if left == right {
                return nums[left]
            }
            
            let key = "\(left),\(right)"
            
            if let saved = memo[key] {
                return saved
            }
            
            let takeLeft = nums[left] - dfs(left + 1, right)
            let takeRight = nums[right] - dfs(left, right - 1)
            
            let result = max(takeLeft, takeRight)
            
            memo[key] = result
            
            return result
        }
        
        return dfs(0, nums.count - 1) >= 0
    }
}