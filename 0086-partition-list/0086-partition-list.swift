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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        let lessDummy = ListNode(0)
        let greaterDummy = ListNode(0)
        
        var less = lessDummy
        var greater = greaterDummy
        
        var current = head
        
        while let node = current {
            
            let next = node.next
            
            if node.val < x {
                less.next = node
                less = node
            } else {
                greater.next = node
                greater = node
            }
            
            current = next
        }
        
        // End the greater list
        greater.next = nil
        
        // Connect less list to greater list
        less.next = greaterDummy.next
        
        return lessDummy.next
    }
}