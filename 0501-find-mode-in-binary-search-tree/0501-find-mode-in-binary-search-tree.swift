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
    func findMode(_ root: TreeNode?) -> [Int] {
        
        var result: [Int] = []
        
        var previous: Int?
        var currentCount = 0
        var maxCount = 0
        
        func dfs(_ node: TreeNode?) {
            
            guard let node = node else {
                return
            }
            
            dfs(node.left)
            
            if previous == node.val {
                currentCount += 1
            } else {
                currentCount = 1
            }
            
            if currentCount > maxCount {
                maxCount = currentCount
                result = [node.val]
            } else if currentCount == maxCount {
                result.append(node.val)
            }
            
            previous = node.val
            
            dfs(node.right)
        }
        
        dfs(root)
        
        return result
    }
}