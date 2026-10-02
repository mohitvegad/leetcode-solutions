class Solution {
    
    func canPartitionKSubsets(
        _ nums: [Int],
        _ k: Int
    ) -> Bool {
        
        let total = nums.reduce(0, +)
        
        if total % k != 0 {
            return false
        }
        
        let target = total / k
        
        var nums = nums.sorted(by: >)
        var used = Array(
            repeating: false,
            count: nums.count
        )
        
        func backtrack(
            _ start: Int,
            _ currentSum: Int,
            _ bucketsRemaining: Int
        ) -> Bool {
            
            // All buckets have been created
            if bucketsRemaining == 0 {
                return true
            }
            
            // Current bucket is complete
            if currentSum == target {
                return backtrack(
                    0,
                    0,
                    bucketsRemaining - 1
                )
            }
            
            for i in start..<nums.count {
                
                if used[i] {
                    continue
                }
                
                if currentSum + nums[i] > target {
                    continue
                }
                
                used[i] = true
                
                if backtrack(
                    i + 1,
                    currentSum + nums[i],
                    bucketsRemaining
                ) {
                    return true
                }
                
                // Backtrack
                used[i] = false
            }
            
            return false
        }
        
        return backtrack(0, 0, k)
    }
}