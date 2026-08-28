class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack: [(Character, Int)] = []
        
        for ch in s {
            if !stack.isEmpty && stack[stack.count - 1].0 == ch {
                let count = stack[stack.count - 1].1 + 1
                stack[stack.count - 1].1 = count
                
                if count == k {
                    stack.removeLast()
                }
            } else {
                stack.append((ch, 1))
            }
        }
        
        var result = ""
        
        for (ch, count) in stack {
            result += String(repeating: String(ch), count: count)
        }
        
        return result
    }
}