class Solution {
    func decodeString(_ s: String) -> String {
        
        var countStack: [Int] = []
        var stringStack: [String] = []
        
        var current = ""
        var number = 0
        
        for char in s {
            
            if char.isNumber {
                
                number = number * 10 + Int(String(char))!
                
            } else if char == "[" {
                
                countStack.append(number)
                stringStack.append(current)
                
                number = 0
                current = ""
                
            } else if char == "]" {
                
                let count = countStack.removeLast()
                let previous = stringStack.removeLast()
                
                current = previous + String(repeating: current, count: count)
                
            } else {
                
                current.append(char)
            }
        }
        
        return current
    }
}