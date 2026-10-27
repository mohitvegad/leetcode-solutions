
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var cash = 0
        var hold = -prices[0]

        for price in prices.dropFirst() {
            let previousCash = cash

            cash = max(cash, hold + price - fee)
            hold = max(hold, previousCash - price)
        }

        return cash
    }
}
