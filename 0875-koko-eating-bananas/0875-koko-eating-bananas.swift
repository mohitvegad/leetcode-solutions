class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = piles.max()!
        
        while left <= right {
            let speed = left + (right - left) / 2
            
            var hours = 0
            
            for pile in piles {
                hours += (pile + speed - 1) / speed
            }
            
            if hours <= h {
                right = speed - 1
            } else {
                left = speed + 1
            }
        }
        
        return left
    }
}