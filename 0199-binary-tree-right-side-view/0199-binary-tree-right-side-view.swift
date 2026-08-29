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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var result = [Int]()
        var queue = [TreeNode]()
        var index = 0

        queue.append(root)

        while index < queue.count {

            let levelSize = queue.count - index

            for i in 0..<levelSize {

                let node = queue[index]
                index += 1

                // Last node of this level
                if i == levelSize - 1 {
                    result.append(node.val)
                }

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }
        }

        return result
    }
}