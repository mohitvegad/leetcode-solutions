class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        
        var count = Array(repeating: 0, count: 1001)
        
        // Count frequency of arr1
        for num in arr1 {
            count[num] += 1
        }
        
        var result = [Int]()
        
        // Add numbers following arr2 order
        for num in arr2 {
            while count[num] > 0 {
                result.append(num)
                count[num] -= 1
            }
        }
        
        // Add remaining numbers in ascending order
        for num in 0..<count.count {
            while count[num] > 0 {
                result.append(num)
                count[num] -= 1
            }
        }
        
        return result
    }
}