class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return []
        }
        
        let intervals = intervals.sorted {
            $0[0] < $1[0]
        }
        
        var result = [[Int]]()
        result.append(intervals[0])
        
        for i in 1..<intervals.count {
            let current = intervals[i]
            let lastIndex = result.count - 1
            
            // Overlap
            if current[0] <= result[lastIndex][1] {
                result[lastIndex][1] = max(
                    result[lastIndex][1],
                    current[1]
                )
            } else {
                result.append(current)
            }
        }
        
        return result
    }
}