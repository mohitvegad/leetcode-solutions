class Solution {
    func isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var number = n
        
        while number != 1 {
            
            if seen.contains(number) {
                return false
            }
            
            seen.insert(number)
            
            number = sumOfSquares(number)
        }
        
        return true
    }
    
    func sumOfSquares(_ number: Int) -> Int {
        var num = number
        var sum = 0
        
        while num > 0 {
            let digit = num % 10
            sum += digit * digit
            num /= 10
        }
        
        return sum
    }
}