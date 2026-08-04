class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        
        var open = 0
        var add = 0
        
        for char in s {
            
            if char == "(" {
                open += 1
            } else {
                
                if open > 0 {
                    open -= 1
                } else {
                    add += 1
                }
            }
        }
        
        return open + add
    }
}