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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var current = dummy
        
        var first = l1
        var second = l2
        
        var carry = 0
        
        while first != nil || second != nil || carry != 0 {
            
            let value1 = first?.val ?? 0
            let value2 = second?.val ?? 0
            
            let sum = value1 + value2 + carry
            
            let digit = sum % 10
            carry = sum / 10
            
            current.next = ListNode(digit)
            current = current.next!
            
            first = first?.next
            second = second?.next
        }
        
        return dummy.next
    }
}