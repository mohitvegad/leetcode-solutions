class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        
        var left = 0
        var right = n - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let papers = n - mid
            
            if citations[mid] >= papers {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return n - left
    }
}