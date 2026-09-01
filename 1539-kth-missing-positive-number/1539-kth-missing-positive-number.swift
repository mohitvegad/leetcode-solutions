class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        
        var left = 0
        var right = arr.count
        
        while left < right {
            
            let mid = left + (right - left) / 2
            
            let missing = arr[mid] - (mid + 1)
            
            if missing < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left + k
    }
}