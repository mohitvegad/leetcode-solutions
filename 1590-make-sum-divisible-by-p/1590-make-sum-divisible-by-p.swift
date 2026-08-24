class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        
        let n = nums.count
        
        var totalRemainder = 0
        
        for num in nums {
            totalRemainder = (totalRemainder + num) % p
        }
        
        if totalRemainder == 0 {
            return 0
        }
        
        var map: [Int: Int] = [:]
        
        map[0] = -1
        
        var prefixRemainder = 0
        var answer = n
        
        for i in 0..<n {
            
            prefixRemainder = (prefixRemainder + nums[i]) % p
            
            let needed = (prefixRemainder - totalRemainder + p) % p
            
            if let previousIndex = map[needed] {
                answer = min(answer, i - previousIndex)
            }
            
            map[prefixRemainder] = i
        }
        
        if answer == n {
            return -1
        }
        
        return answer
    }
}