class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var j = 0
        
        for num in pushed {
            stack.append(num)
            
            while !stack.isEmpty && j < popped.count &&
                  stack.last! == popped[j] {
                stack.removeLast()
                j += 1
            }
        }
        
        return stack.isEmpty
    }
}