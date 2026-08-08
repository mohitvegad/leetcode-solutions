class Solution {
    
    private let original: [Int]
    private var nums: [Int]
    
    init(_ nums: [Int]) {
        self.original = nums
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return original
    }
    
    func shuffle() -> [Int] {
        for i in stride(from: nums.count - 1, through: 1, by: -1) {
            let j = Int.random(in: 0...i)
            nums.swapAt(i, j)
        }
        
        return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */