class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var result = 0
        
        for i in 0..<n {
            let value = start + 2 * i
            result ^= value
        }
        
        return result
    }
}