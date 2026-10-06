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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        
        let dummy = TreeNode(0)
        var current = dummy
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            
            inorder(node.left)
            
            node.left = nil
            current.right = node
            current = node
            
            inorder(node.right)
        }
        
        inorder(root)
        
        return dummy.right
    }
}