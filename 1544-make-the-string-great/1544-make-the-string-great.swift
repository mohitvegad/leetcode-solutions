class Solution {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        
        for char in s {
            if let last = stack.last,
               abs(Int(last.asciiValue!) - Int(char.asciiValue!)) == 32 {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        return String(stack)
    }
}