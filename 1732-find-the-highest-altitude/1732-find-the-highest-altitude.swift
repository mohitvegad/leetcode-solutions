class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var altitude = 0
        var highest = 0
        
        for change in gain {
            altitude += change
            highest = max(highest, altitude)
        }
        
        return highest
    }
}