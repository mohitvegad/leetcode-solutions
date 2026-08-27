class Solution {
    func maxScore(_ s: String) -> Int {
        
        let chars = Array(s)
        
        var rightOnes = 0
        
        for ch in chars {
            if ch == "1" {
                rightOnes += 1
            }
        }
        
        var leftZeros = 0
        var answer = 0
        
        for i in 0..<(chars.count - 1) {
            
            if chars[i] == "0" {
                leftZeros += 1
            } else {
                rightOnes -= 1
            }
            
            let score = leftZeros + rightOnes
            
            answer = max(answer, score)
        }
        
        return answer
    }
}