class Solution {
    func countBits(_ n: Int) -> [Int] {
        var bits = Array(repeating: 0, count: n + 1)
        
        if n == 0 {
            return bits
        }
        
        for i in 1...n {
            bits[i] = bits[i / 2] + (i % 2)
        }
        
        return bits
    }
}