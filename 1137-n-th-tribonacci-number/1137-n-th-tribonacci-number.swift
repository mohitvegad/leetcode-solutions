class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }

        if n == 1 || n == 2 {
            return 1
        }

        var first = 0
        var second = 1
        var third = 1

        for _ in 3...n {
            let next = first + second + third
            first = second
            second = third
            third = next
        }

        return third
    }
}