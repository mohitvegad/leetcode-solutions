class Solution {
    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        
        var covered = Array(repeating: false, count: 51)
        
        for range in ranges {
            let start = range[0]
            let end = range[1]
            
            for num in start...end {
                covered[num] = true
            }
        }
        
        for num in left...right {
            if covered[num] == false {
                return false
            }
        }
        
        return true
    }
}