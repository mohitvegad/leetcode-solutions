class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        if points.isEmpty {
            return 0
        }
        
        let sorted = points.sorted {
            $0[1] < $1[1]
        }
        
        var arrows = 1
        var arrowPosition = sorted[0][1]
        
        for i in 1..<sorted.count {
            
            let start = sorted[i][0]
            
            if start > arrowPosition {
                arrows += 1
                arrowPosition = sorted[i][1]
            }
        }
        
        return arrows
    }
}