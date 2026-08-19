class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let text = Array(haystack)
        let pattern = Array(needle)
        
        if pattern.isEmpty {
            return 0
        }
        
        if pattern.count > text.count {
            return -1
        }
        
        for i in 0...(text.count - pattern.count) {
            
            var j = 0
            
            while j < pattern.count &&
                  text[i + j] == pattern[j] {
                j += 1
            }
            
            if j == pattern.count {
                return i
            }
        }
        
        return -1
    }
}