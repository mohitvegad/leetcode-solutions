class Solution {
    let phone: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]

    var result = [String]()
    var current = ""

    func letterCombinations(_ digits: String) -> [String] {
        result = []
        current = ""

        if digits.isEmpty {
            return []
        }

        let digitsArray = Array(digits)

        backtrack(digitsArray, 0)

        return result
    }

    func backtrack(_ digits: [Character], _ index: Int) {
        if index == digits.count {
            result.append(current)
            return
        }

        let digit = digits[index]
        let letters = phone[digit]!

        for letter in letters {
            current.append(letter)

            backtrack(digits, index + 1)

            current.removeLast()
        }
    }
}