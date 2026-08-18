class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        
        var dp = Array(repeating: 0, count: n)
        
        dp[0] = nums[0]
        
        for i in 1..<n {
            dp[i] = max(nums[i], dp[i - 1] + nums[i])
        }
        
        return dp.max()!
    }
}