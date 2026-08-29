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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        
        guard let root = root else { return [] }
        
        var result: [Double] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            
            let levelSize = queue.count
            var levelSum: Int = 0
            var nextLevel: [TreeNode] = []
            
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                levelSum += node.val
                
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            
            let average = Double(levelSum) / Double(levelSize)
            result.append(average)
            
            queue = nextLevel
        }
        
        return result
    }
}