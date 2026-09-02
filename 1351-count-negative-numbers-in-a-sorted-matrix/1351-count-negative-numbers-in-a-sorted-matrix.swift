class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        
        var count = 0
        
        for row in grid {
            
            var left = 0
            var right = row.count - 1
            
            while left <= right {
                
                let mid = left + (right - left) / 2
                
                if row[mid] < 0 {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            count += row.count - left
        }
        
        return count
    }
}