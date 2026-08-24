class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        
        var prefixSum: Int64 = 0
        var answer: Int64 = 0
        
        for i in 0..<nums.count {
            
            prefixSum += Int64(nums[i])
            
            let count = Int64(i + 1)
            
            let average = (prefixSum + count - 1) / count
            
            answer = max(answer, average)
        }
        
        return Int(answer)
    }
}