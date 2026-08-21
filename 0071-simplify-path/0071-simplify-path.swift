class Solution {
    func simplifyPath(_ path: String) -> String {
        
        var stack: [String] = []
        
        let parts = path.split(separator: "/")
        
        for part in parts {
            
            if part == "." {
                continue
            }
            
            if part == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(part))
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
}