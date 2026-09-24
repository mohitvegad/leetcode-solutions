class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        
        var seen = Set<Int>()
        var duplicate = 0
        
        for num in nums {
            if seen.contains(num) {
                duplicate = num
            } else {
                seen.insert(num)
            }
        }
        
        var missing = 0
        
        for num in 1...nums.count {
            if !seen.contains(num) {
                missing = num
                break
            }
        }
        
        return [duplicate, missing]
    }
}