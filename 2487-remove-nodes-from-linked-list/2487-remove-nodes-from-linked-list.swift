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
    func removeNodes(_ head: ListNode?) -> ListNode? {
        
        // Base case
        if head == nil || head?.next == nil {
            return head
        }
        
        // First solve the rest of the list
        head?.next = removeNodes(head?.next)
        
        // If the next node is bigger,
        // remove the current node
        if head!.val < head!.next!.val {
            return head!.next
        }
        
        return head
    }
}