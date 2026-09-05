class Solution {
    func kthCharacter(_ k: Int) -> Character {
        
        if k == 1 {
            return "a"
        }
        
        var length = 1
        
        while length < k {
            length *= 2
        }
        
        return findCharacter(k, length)
    }
    
    func findCharacter(_ k: Int, _ length: Int) -> Character {
        
        if length == 1 {
            return "a"
        }
        
        let half = length / 2
        
        if k <= half {
            return findCharacter(k, half)
        } else {
            let character = findCharacter(k - half, half)
            
            let ascii = character.asciiValue!
            return Character(UnicodeScalar(ascii + 1))
        }
    }
}