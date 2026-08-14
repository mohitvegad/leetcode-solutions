class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        var leftSum = 0

        for i in 0..<nums.count {
            let rightSum = total - leftSum - nums[i]

            if leftSum == rightSum {
                return i
            }

            leftSum += nums[i]
        }

        return -1
    }
}