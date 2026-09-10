class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        let characters = Array(s)

        for i in 0..<characters.count {
            let char = characters[i]

            let lower = char.lowercased()
            let upper = char.uppercased()

            if !s.contains(lower) || !s.contains(upper) {
                let left = String(characters[0..<i])
                let right = String(characters[(i + 1)..<characters.count])

                let leftResult = longestNiceSubstring(left)
                let rightResult = longestNiceSubstring(right)

                return leftResult.count >= rightResult.count
                    ? leftResult
                    : rightResult
            }
        }

        return s
    }
}