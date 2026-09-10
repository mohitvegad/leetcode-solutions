class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        
        var map = [String: Int]()

        for word in words {
            map[word, default: 0] += 1
        }


        var sortedValue = map.sorted {
            if $0.value != $1.value {
                return $0.value > $1.value
            } else {
                return $0.key < $1.key
                }
            }

        
        var result = [String]()

        for i in 0..<k {
            result.append(sortedValue[i].key)
        }

        return result
        
    }
}
// class Solution {
//     func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
//         var elementDict = [Int: Int]()
        
//         for value in nums {
//             elementDict[value, default: 0] += 1
//         }
        
//         let sorted = elementDict.sorted {
//             $0.value > $1.value
//         }
        
//         var result = [Int]()
        
//         for i in 0..<k {
//             result.append(sorted[i].key)
//         }
        
//         return result
//     }
// }