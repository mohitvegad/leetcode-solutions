class Solution {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }

        var prev = 0
        var curr = 1

        for _ in 2...n {
            let next = prev + curr
            prev = curr
            curr = next
        }

        return curr
    }
}