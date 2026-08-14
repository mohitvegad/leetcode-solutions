class Solution {
    func countValidSelections(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        
        var leftSum = 0
        var answer = 0
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                let rightSum = total - leftSum
                
                if leftSum == rightSum {
                    answer += 2
                } else if abs(leftSum - rightSum) == 1 {
                    answer += 1
                }
            }
            
            leftSum += nums[i]
        }
        
        return answer
    }
}