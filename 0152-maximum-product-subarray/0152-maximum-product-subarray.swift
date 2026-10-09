class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = nums[0]
        var minProduct = nums[0]
        var result = nums[0]

        for i in 1..<nums.count {
            let num = nums[i]

            if num < 0 {
                swap(&maxProduct, &minProduct)
            }

            maxProduct = max(num, maxProduct * num)
            minProduct = min(num, minProduct * num)

            result = max(result, maxProduct)
        }

        return result
    }
}