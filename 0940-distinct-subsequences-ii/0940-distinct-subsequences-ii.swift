class Solution {
    func distinctSubseqII(_ s: String) -> Int {
        let MOD: Int64 = 1_000_000_007
        
        var dp: Int64 = 1
        
        var last = Array(repeating: Int64(0), count: 26)
        
        for ch in s.utf8 {
            let index = Int(ch - 97)
            
            let newDp = (2 * dp - last[index] + MOD) % MOD
            
            last[index] = dp
            dp = newDp
        }
        
        return Int((dp - 1 + MOD) % MOD)
    }
}