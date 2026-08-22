class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        
        var answer = prices
        var stack: [Int] = []
        
        for i in 0..<prices.count {
            
            while let last = stack.last,
                  prices[last] >= prices[i] {
                
                answer[last] -= prices[i]
                stack.removeLast()
            }
            
            stack.append(i)
        }
        
        return answer
    }
}