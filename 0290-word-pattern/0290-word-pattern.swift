class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let words = s.split(separator: " ").map(String.init)
        
        if pattern.count != words.count {
            return false
        }
        
        var patternToWord = [Character: String]()
        var wordToPattern = [String: Character]()
        
        for (character, word) in zip(pattern, words) {
            
            if let existingWord = patternToWord[character] {
                if existingWord != word {
                    return false
                }
            }
            
            if let existingCharacter = wordToPattern[word] {
                if existingCharacter != character {
                    return false
                }
            }
            
            patternToWord[character] = word
            wordToPattern[word] = character
        }
        
        return true
    }
}