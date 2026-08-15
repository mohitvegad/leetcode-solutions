/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        
        // Copy the next node's value
        node?.val = node?.next?.val ?? 0
        
        // Skip the next node
        node?.next = node?.next?.next
    }
}