class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        let a = Array(num1)
        let b = Array(num2)
        
        var result = Array(repeating: 0, count: a.count + b.count)
        
        for i in stride(from: a.count - 1, through: 0, by: -1) {
            
            for j in stride(from: b.count - 1, through: 0, by: -1) {
                
                let digit1 = Int(String(a[i]))!
                let digit2 = Int(String(b[j]))!
                
                let product = digit1 * digit2 + result[i + j + 1]
                
                result[i + j + 1] = product % 10
                result[i + j] += product / 10
            }
        }
        
        var answer = ""
        
        for digit in result {
            if answer.isEmpty && digit == 0 {
                continue
            }
            
            answer += String(digit)
        }
        
        return answer
    }
}