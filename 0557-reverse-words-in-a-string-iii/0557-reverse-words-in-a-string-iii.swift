class Solution {
    func reverseWords(_ s: String) -> String {
        
        let words = s.split(separator: " ")
        
        var result = [String]()
        
        for word in words {
            result.append(String(word.reversed()))
        }
        
        return result.joined(separator: " ")
    }
}