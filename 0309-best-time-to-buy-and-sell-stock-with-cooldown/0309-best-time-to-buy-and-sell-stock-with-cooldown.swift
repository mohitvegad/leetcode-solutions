
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var hold = -prices[0]
        var sold = Int.min
        var rest = 0

        for i in 1..<prices.count {
            let price = prices[i]

            let holdToday = max(hold, rest - price)
            let soldToday = hold + price
            let restToday = max(rest, sold)

            hold = holdToday
            sold = soldToday
            rest = restToday
        }

        return max(sold, rest)
    }
}
