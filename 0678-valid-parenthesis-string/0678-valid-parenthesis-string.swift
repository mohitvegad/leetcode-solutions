class Solution {
    func checkValidString(_ s: String) -> Bool {
        
        var low = 0
        var high = 0
        
        for char in s {
            
            if char == "(" {
                low += 1
                high += 1
                
            } else if char == ")" {
                low -= 1
                high -= 1
                
            } else { // '*'
                low -= 1      // treat * as ')'
                high += 1     // treat * as '('
            }
            
            // Too many closing brackets
            if high < 0 {
                return false
            }
            
            // low cannot be negative
            if low < 0 {
                low = 0
            }
        }
        
        return low == 0
    }
}