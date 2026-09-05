class Solution {
    func minLengthAfterRemovals(_ nums: [Int]) -> Int {
        
        var maxCount = 1
        var currentCount = 1
        
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                currentCount += 1
            } else {
                currentCount = 1
            }
            
            maxCount = max(maxCount, currentCount)
        }
        
        let otherCount = nums.count - maxCount
        
        if maxCount > otherCount {
            return maxCount - otherCount
        } else {
            return nums.count % 2
        }
    }
}