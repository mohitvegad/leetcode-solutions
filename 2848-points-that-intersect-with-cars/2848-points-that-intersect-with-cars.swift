class Solution {
    func numberOfPoints(_ nums: [[Int]]) -> Int {
        
        var covered = Array(repeating: false, count: 101)
        
        for car in nums {
            let start = car[0]
            let end = car[1]
            
            for point in start...end {
                covered[point] = true
            }
        }
        
        return covered.filter { $0 }.count
    }
}