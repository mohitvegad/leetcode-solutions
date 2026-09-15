class Solution {
    var result = [[Int]]()
    var current = [Int]()

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        result = []
        current = []

        backtrack(1, n, k)

        return result
    }

    func backtrack(_ start: Int, _ n: Int, _ k: Int) {
        if current.count == k {
            result.append(current)
            return
        }

        for i in start..<n + 1 {
            current.append(i)

            backtrack(i + 1, n, k)

            current.removeLast()
        }
    }
}