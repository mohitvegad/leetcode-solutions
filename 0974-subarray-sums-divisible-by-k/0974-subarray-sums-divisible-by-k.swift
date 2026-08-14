class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var remainderCount: [Int: Int] = [0: 1]
        var prefixSum = 0
        var answer = 0
        
        for num in nums {
            prefixSum += num
            
            var remainder = prefixSum % k
            
            if remainder < 0 {
                remainder += k
            }
            
            if let count = remainderCount[remainder] {
                answer += count
            }
            
            remainderCount[remainder, default: 0] += 1
        }
        
        return answer
    }
}