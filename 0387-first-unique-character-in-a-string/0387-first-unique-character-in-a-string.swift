class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        var count: [Character: Int] = [:]
        
        // 1. Count each character
        for char in s {
            count[char, default: 0] += 1
        }
        
        // 2. Find the first character that appears once
        for (index, char) in s.enumerated() {
            if count[char] == 1 {
                return index
            }
        }
        
        return -1
    }
}