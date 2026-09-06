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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        var path: [Int] = []
        
        func dfs(_ node: TreeNode?, _ remaining: Int) {
            
            guard let node = node else {
                return
            }
            
            path.append(node.val)
            
            let newRemaining = remaining - node.val
            
            if node.left == nil && node.right == nil {
                
                if newRemaining == 0 {
                    result.append(path)
                }
                
                path.removeLast()
                return
            }
            
            dfs(node.left, newRemaining)
            dfs(node.right, newRemaining)
            
            path.removeLast()
        }
        
        dfs(root, targetSum)
        
        return result
    }
}