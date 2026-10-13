
class CombinationIterator {
    private var combinations = [String]()
    private var index = 0

    init(_ characters: String, _ combinationLength: Int) {
        let chars = Array(characters)
        var current = [Character]()

        func backtrack(_ start: Int) {
            if current.count == combinationLength {
                combinations.append(String(current))
                return
            }

            for i in start..<chars.count {
                current.append(chars[i])
                backtrack(i + 1)
                current.removeLast()
            }
        }

        backtrack(0)
    }

    func next() -> String {
        let answer = combinations[index]
        index += 1
        return answer
    }

    func hasNext() -> Bool {
        return index < combinations.count
    }
}
/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */