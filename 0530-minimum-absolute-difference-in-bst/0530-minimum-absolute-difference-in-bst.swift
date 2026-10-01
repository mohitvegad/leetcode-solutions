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
    
    var previous: Int?
    var minimum = Int.max
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        
        inorder(root)
        
        return minimum
    }
    
    func inorder(_ node: TreeNode?) {
        
        guard let node = node else {
            return
        }
        
        // Left
        inorder(node.left)
        
        // Current
        if let previous = previous {
            minimum = min(
                minimum,
                node.val - previous
            )
        }
        
        previous = node.val
        
        // Right
        inorder(node.right)
    }
}