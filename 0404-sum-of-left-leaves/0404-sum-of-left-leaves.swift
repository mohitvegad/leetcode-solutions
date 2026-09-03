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
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }

    var sum = 0

    if let left = root.left {
        if left.left == nil && left.right == nil {
            sum += left.val
        } else {
            sum += sumOfLeftLeaves(left)
        }
    }

    sum += sumOfLeftLeaves(root.right)

    return sum
}
}