class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var elementDict = [Int: Int]()
        
        for value in nums {
            elementDict[value, default: 0] += 1
        }
        
        let sorted = elementDict.sorted {
            $0.value > $1.value
        }
        
        var result = [Int]()
        
        for i in 0..<k {
            result.append(sorted[i].key)
        }
        
        return result
    }
}