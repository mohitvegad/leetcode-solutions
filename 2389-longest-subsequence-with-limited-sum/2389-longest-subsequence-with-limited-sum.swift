class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        
        let sortedNums = nums.sorted()
        
        var prefix = [Int]()
        var sum = 0
        
        for num in sortedNums {
            sum += num
            prefix.append(sum)
        }
        
        var result = [Int]()
        
        for query in queries {
            var left = 0
            var right = prefix.count - 1
            var answer = 0
            
            while left <= right {
                let mid = left + (right - left) / 2
                
                if prefix[mid] <= query {
                    answer = mid + 1
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            
            result.append(answer)
        }
        
        return result
    }
}