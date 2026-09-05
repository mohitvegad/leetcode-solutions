class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        
        var i = 0
        
        while i < arr.count {
            
            if arr[i] == 0 {
                for j in stride(from: arr.count - 1, through: i + 1, by: -1) {
                    arr[j] = arr[j - 1]
                }
                
                if i + 1 < arr.count {
                    arr[i + 1] = 0
                }
                
                i += 2
            } else {
                i += 1
            }
        }
    }
}