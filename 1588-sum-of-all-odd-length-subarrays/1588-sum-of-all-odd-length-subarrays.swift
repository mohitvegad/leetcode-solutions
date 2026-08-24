class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        
        let n = arr.count
        
        var prefix = Array(repeating: 0, count: n + 1)
        
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + arr[i]
        }
        
        var answer = 0
        
        for start in 0..<n {
            
            for end in start..<n {
                
                let length = end - start + 1
                
                if length % 2 == 1 {
                    answer += prefix[end + 1] - prefix[start]
                }
            }
        }
        
        return answer
    }
}