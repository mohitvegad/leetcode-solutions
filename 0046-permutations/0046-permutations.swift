class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var used = Array(repeating: false, count: nums.count)

        func backtrack() {
            // We have used every number
            if current.count == nums.count {
                result.append(current)
                return
            }

            for i in 0..<nums.count {
                
                if used[i] {
                    continue
                }

                // 1. Choose
                current.append(nums[i])
                used[i] = true

                // 2. Explore
                backtrack()

                // 3. Undo the choice
                current.removeLast()
                used[i] = false
            }
        }

        backtrack()
        return result
    }
}