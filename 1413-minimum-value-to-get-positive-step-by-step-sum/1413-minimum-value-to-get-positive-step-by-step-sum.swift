class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        
        var currentSum = 0
        var minimumSum = 0
        
        for num in nums {
            currentSum += num
            minimumSum = min(minimumSum, currentSum)
        }
        
        return 1 - minimumSum
    }
}
