class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        
        var left = weights.max()!
        var right = weights.reduce(0, +)
        
        while left < right {
            
            let capacity = left + (right - left) / 2
            
            var daysNeeded = 1
            var currentWeight = 0
            
            for weight in weights {
                
                if currentWeight + weight > capacity {
                    daysNeeded += 1
                    currentWeight = 0
                }
                
                currentWeight += weight
            }
            
            if daysNeeded <= days {
                right = capacity
            } else {
                left = capacity + 1
            }
        }
        
        return left
    }
}