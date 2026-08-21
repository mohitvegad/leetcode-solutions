class Solution {
    func calculate(_ s: String) -> Int {
        
        var stack: [Int] = []
        var number = 0
        var operation = "+"
        
        for char in s + "+" {
            
            if char.isNumber {
                number = number * 10 + Int(String(char))!
                continue
            }
            
            if char == " " {
                continue
            }
            
            switch operation {
            case "+":
                stack.append(number)
                
            case "-":
                stack.append(-number)
                
            case "*":
                let last = stack.removeLast()
                stack.append(last * number)
                
            case "/":
                let last = stack.removeLast()
                stack.append(last / number)
                
            default:
                break
            }
            
            operation = String(char)
            number = 0
        }
        
        return stack.reduce(0, +)
    }
}