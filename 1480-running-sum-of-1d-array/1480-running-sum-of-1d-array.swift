class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = nums
        var sum = 0
        
        for i in 0..<nums.count {
            sum += nums[i]
            result[i] = sum
        }
        
        return result
    }
}