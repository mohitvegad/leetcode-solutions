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
    func reorderList(_ head: ListNode?) {
        
        // -------------------------
        // 1. Find the middle -- first middle
        // -------------------------
        
        var slow = head
        var fast = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // -------------------------
        // 2. Split into two lists
        // -------------------------
        
        var second = slow?.next
        slow?.next = nil
        
        // -------------------------
        // 3. Reverse second half
        // -------------------------
        
        var previous: ListNode? = nil
        
        while second != nil {
            let next = second?.next 
            
            second?.next = previous
            
            previous = second
            second = next
        }
        
        second = previous
        
        // -------------------------
        // 4. Merge the two lists
        // -------------------------
        
        var first = head
        
        while first != nil && second != nil {
            
            let firstNext = first?.next
            let secondNext = second?.next
            
            first?.next = second
            second?.next = firstNext
            
            first = firstNext
            second = secondNext
        }
    }
}