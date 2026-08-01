class Solution {
    func reverseVowels(_ s: String) -> String {
        
        let vowels: Set<Character> = [
            "a", "e", "i", "o", "u",
            "A", "E", "I", "O", "U"
        ]
        
        var chars = Array(s)
        
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            
            // Move left until vowel
            while left < right && !vowels.contains(chars[left]) {
                left += 1
            }
            
            // Move right until vowel
            while left < right && !vowels.contains(chars[right]) {
                right -= 1
            }
            
            // Swap vowels
            chars.swapAt(left, right)
            
            left += 1
            right -= 1
        }
        
        return String(chars)
    }
}