class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        
        let n = nums.count
        
        var length = Array(repeating: 1, count: n)
        var count = Array(repeating: 1, count: n)
        
        var maxLength = 1
        
        for i in 0..<n {
            
            for j in 0..<i {
                
                if nums[j] < nums[i] {
                    
                    if length[j] + 1 > length[i] {
                        
                        length[i] = length[j] + 1
                        count[i] = count[j]
                        
                    } else if length[j] + 1 == length[i] {
                        
                        count[i] += count[j]
                    }
                }
            }
            
            maxLength = max(maxLength, length[i])
        }
        
        
        var answer = 0
        
        for i in 0..<n {
            if length[i] == maxLength {
                answer += count[i]
            }
        }
        
        return answer
    }
}