class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var result = [String]()
        var index = 0
        
        for num in 1...n {
            
            result.append("Push")
            
            if num == target[index] {
                index += 1
                
                if index == target.count {
                    break
                }
            } else {
                result.append("Pop")
            }
        }
        
        return result
    }
}