class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        
        let totalSum = nums.reduce(0, +)
        
        var leftSum = 0
        var answer: [Int] = []
        
        for i in 0..<nums.count {
            
            let rightSum = totalSum - leftSum - nums[i]
            
            answer.append(abs(leftSum - rightSum))
            
            leftSum += nums[i]
        }
        
        return answer
    }
}