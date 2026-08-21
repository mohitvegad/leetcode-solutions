class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        
        var low = 0
        var high = n
        
        while low <= high {
            
            let mid = low + (high - low) / 2
            
            let coinsNeeded = mid * (mid + 1) / 2
            
            if coinsNeeded == n {
                return mid
            } else if coinsNeeded < n {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return high
    }
}