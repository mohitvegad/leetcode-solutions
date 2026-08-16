/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var current = head
        
        while let node = current {
            
            let next = node.next
            
            var prev = dummy
            
            // Find where node should be inserted
            while prev.next != nil && prev.next!.val < node.val {
                prev = prev.next!
            }
            
            // Insert node
            node.next = prev.next
            prev.next = node
            
            // Move to next original node
            current = next
        }
        
        return dummy.next
    }
}