class Solution {
    
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        
        var positions = [Character: [Int]]()
        
        // Store every position of every character
        for (index, character) in s.enumerated() {
            positions[character, default: []].append(index)
        }
        
        var answer = 0
        
        for word in words {
            if isSubsequence(word, positions: positions) {
                answer += 1
            }
        }
        
        return answer
    }
    
    func isSubsequence(
        _ word: String,
        positions: [Character: [Int]]
    ) -> Bool {
        
        var previousIndex = -1
        
        for character in word {
            
            guard let indexes = positions[character] else {
                return false
            }
            
            // Find first index > previousIndex
            let nextIndex = firstGreaterThan(
                indexes,
                previousIndex
            )
            
            guard let nextIndex = nextIndex else {
                return false
            }
            
            previousIndex = nextIndex
        }
        
        return true
    }
    
    func firstGreaterThan(
        _ array: [Int],
        _ target: Int
    ) -> Int? {
        
        var left = 0
        var right = array.count
        
        while left < right {
            
            let middle = (left + right) / 2
            
            if array[middle] <= target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        if left < array.count {
            return array[left]
        }
        
        return nil
    }
}