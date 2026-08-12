class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        
        var digitCount = [Int: Int]()
        for digit in digits {
            digitCount[digit, default: 0] += 1
        }

        var result = [Int]()
        for num in 100...999 where num % 2 == 0 {
            let h = num / 100
            let t = (num / 10) % 10
            let o = num % 10
            
            var tempCount = digitCount
            tempCount[h, default: 0] -= 1
            tempCount[t, default: 0] -= 1
            tempCount[o, default: 0] -= 1

            if tempCount[h, default: 0] >= 0 &&
                tempCount[t, default: 0] >= 0 &&
                tempCount[o, default: 0] >= 0 {
                result.append(num)
            }
        }

        return result
    }
}