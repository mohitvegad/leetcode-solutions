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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        var path = [String]()
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            
            path.append(String(node.val))
            
            if node.left == nil && node.right == nil {
                result.append(path.joined(separator: "->"))
            } else {
                dfs(node.left)
                dfs(node.right)
            }
            
            path.removeLast()
        }
        
        dfs(root)
        
        return result
    }
}