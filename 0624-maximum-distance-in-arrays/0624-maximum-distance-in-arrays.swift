class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        
        var minValue = arrays[0][0]
        var maxValue = arrays[0][arrays[0].count - 1]
        
        var result = 0
        
        for i in 1..<arrays.count {
            
            let currentMin = arrays[i][0]
            let currentMax = arrays[i][arrays[i].count - 1]
            
            // Current array's maximum with previous minimum
            result = max(result, currentMax - minValue)
            
            // Previous maximum with current array's minimum
            result = max(result, maxValue - currentMin)
            
            // Update global min and max
            minValue = min(minValue, currentMin)
            maxValue = max(maxValue, currentMax)
        }
        
        return result
    }
}