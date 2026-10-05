class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        
        var stack = [Int]()
        
        // Build decreasing stack of candidate left indices
        for i in 0..<nums.count {
            
            if stack.isEmpty ||
                nums[i] < nums[stack.last!] {
                
                stack.append(i)
            }
        }
        
        var answer = 0
        
        // Scan from right to left
        for j in stride(
            from: nums.count - 1,
            through: 0,
            by: -1
        ) {
            
            while let i = stack.last,
                  nums[i] <= nums[j] {
                
                answer = max(
                    answer,
                    j - i
                )
                
                stack.removeLast()
            }
        }
        
        return answer
    }
}