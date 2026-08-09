class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        
        var sToT: [Character: Character] = [:]
        var tToS: [Character: Character] = [:]
        
        for i in 0..<sArray.count {
            let charS = sArray[i]
            let charT = tArray[i]
            
            if let mapped = sToT[charS], mapped != charT {
                return false
            }
            
            if let mapped = tToS[charT], mapped != charS {
                return false
            }
            
            sToT[charS] = charT
            tToS[charT] = charS
        }
        
        return true
    }
}