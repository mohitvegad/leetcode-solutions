class Solution {
    func sortSentence(_ s: String) -> String {

        let words = s.split(separator: " ")


        let sorted = words.sorted { word1, word2 in
        // Safe unwrapping
            guard let n1 = word1.last.flatMap({ Int(String($0)) }),
                  let n2 = word2.last.flatMap({ Int(String($0)) }) else {
                return false
        }
        return n1 < n2

        }

        let result = sorted.map { word in
            String(word.dropLast())
        }
    
        return result.joined(separator: " ")

    }
}