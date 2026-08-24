class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var firstIndex: [Int: Int] = [:]
        
        firstIndex[0] = -1
        
        var sum = 0
        var maxLength = 0
        
        for i in 0..<nums.count {
            
            if nums[i] == 0 {
                sum -= 1
            } else {
                sum += 1
            }
            
            if let first = firstIndex[sum] {
                
                let length = i - first
                maxLength = max(maxLength, length)
                
            } else {
                
                firstIndex[sum] = i
            }
        }
        
        return maxLength
    }
}