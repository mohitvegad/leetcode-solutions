class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        
        var left = 0
        var right = Int(Double(c).squareRoot())
        
        while left <= right {
            
            let sum = left * left + right * right
            
            if sum == c {
                return true
            }
            
            if sum < c {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return false
    }
}