class Solution {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        
        var sortedArray = nums.sorted()

        var result = [Int]()

        for i in 0..<sortedArray.count {
            if sortedArray[i] == target {
                result.append(i)
            }
        }

        return result
    }
}