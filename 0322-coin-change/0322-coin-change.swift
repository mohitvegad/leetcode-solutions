class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for currentAmount in 1..<dp.count {
            for coin in coins where coin <= currentAmount {
                dp[currentAmount] = min(
                    dp[currentAmount],
                    dp[currentAmount - coin] + 1
                )
            }
        }

        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}