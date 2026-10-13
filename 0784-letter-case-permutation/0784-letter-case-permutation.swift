
class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        let chars = Array(s)
        var result = [String]()
        var current = [Character]()

        func backtrack(_ index: Int) {
            if index == chars.count {
                result.append(String(current))
                return
            }

            let char = chars[index]

            if char.isLetter {
                current.append(Character(String(char).lowercased()))
                backtrack(index + 1)
                current.removeLast()

                current.append(Character(String(char).uppercased()))
                backtrack(index + 1)
                current.removeLast()
            } else {
                current.append(char)
                backtrack(index + 1)
                current.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}