class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var remainderIndex: [Int: Int] = [0: -1]
        var prefixSum = 0
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            
            let remainder = prefixSum % k
            
            if let previousIndex = remainderIndex[remainder] {
                
                if i - previousIndex >= 2 {
                    return true
                }
                
            } else {
                remainderIndex[remainder] = i
            }
        }
        
        return false
    }
}