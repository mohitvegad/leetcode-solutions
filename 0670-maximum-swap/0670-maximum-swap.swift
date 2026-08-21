class Solution {
    func maximumSwap(_ num: Int) -> Int {
        
        var digits = Array(String(num))
        
        for i in 0..<digits.count {
            
            var maxIndex = i
            
            for j in i..<digits.count {
                if digits[j] >= digits[maxIndex] {
                    maxIndex = j
                }
            }
            
            if digits[maxIndex] > digits[i] {
                digits.swapAt(i, maxIndex)
                break
            }
        }
        
        return Int(String(digits))!
    }
}