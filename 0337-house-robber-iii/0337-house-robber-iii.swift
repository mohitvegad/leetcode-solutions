/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func rob(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?) -> (Int, Int) {
            guard let node = node else {
                return (0, 0)
            }
            
            let left = dfs(node.left)
            let right = dfs(node.right)
            
            let rob = node.val + left.1 + right.1
            
            let dontRob = max(left.0, left.1)
                       + max(right.0, right.1)
            
            return (rob, dontRob)
        }
        
        let result = dfs(root)
        
        return max(result.0, result.1)
    }
}