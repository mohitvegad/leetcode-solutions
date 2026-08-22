class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        
        let n = nums.count
        
        var answer = Array(repeating: -1, count: n)
        var stack: [Int] = []  
        
        for i in 0..<2 * n {
            
            let index = i % n
            
            while !stack.isEmpty && nums[stack.last!] < nums[index] {
                let previousIndex = stack.removeLast()
                answer[previousIndex] = nums[index]
            }
            
            // Only add indexes during the first pass
            if i < n {
                stack.append(index)
            }
        }
        
        return answer
    }
}