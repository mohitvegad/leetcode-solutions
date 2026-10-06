class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sorted = citations.sorted()
        let n = sorted.count
        
        for i in 0..<n {
            let papers = n - i
            
            if sorted[i] >= papers {
                return papers
            }
        }
        
        return 0
    }
}