
class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count

        var dp = Array(repeating: 0, count: n + 1)

        dp[0] = 1

        for i in 1...n {

            if chars[i - 1] != "0" {
                dp[i] += dp[i - 1]
            }

            if i >= 2 {
                let first = Int(String(chars[i - 2]))!
                let second = Int(String(chars[i - 1]))!
                let number = first * 10 + second

                if number >= 10 && number <= 26 {
                    dp[i] += dp[i - 2]
                }
            }
        }

        return dp[n]
    }
}
