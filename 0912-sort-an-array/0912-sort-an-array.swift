class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }

        let middle = nums.count / 2

        let left = sortArray(Array(nums[..<middle]))
        let right = sortArray(Array(nums[middle...]))

        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var result: [Int] = []

        var i = 0
        var j = 0

        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }

        while i < left.count {
            result.append(left[i])
            i += 1
        }

        while j < right.count {
            result.append(right[j])
            j += 1
        }

        return result
    }
}