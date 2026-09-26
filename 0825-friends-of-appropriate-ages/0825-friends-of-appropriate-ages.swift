class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        
        var count = Array(repeating: 0, count: 121)
        
        // Count how many people have each age
        for age in ages {
            count[age] += 1
        }
        
        var requests = 0
        
        // A = sender
        for ageA in 1...120 {
            
            if count[ageA] == 0 {
                continue
            }
            
            // B = receiver
            for ageB in 1...120 {
                
                if count[ageB] == 0 {
                    continue
                }
                
                if Double(ageB) <= 0.5 * Double(ageA) + 7 {
                    continue
                }
                
                if ageB > ageA {
                    continue
                }
                
                if ageB > 100 && ageA < 100 {
                    continue
                }
                
                if ageA == ageB {
                    requests += count[ageA] * (count[ageA] - 1)
                } else {
                    requests += count[ageA] * count[ageB]
                }
            }
        }
        
        return requests
    }
}