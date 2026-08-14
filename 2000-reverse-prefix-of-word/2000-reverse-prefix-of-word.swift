class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var chars = Array(word)
        
        guard let index = chars.firstIndex(of: ch) else {
            return word
        }
        
        var left = 0
        var right = index
        
        while left < right {
            chars.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        return String(chars)
    }
}