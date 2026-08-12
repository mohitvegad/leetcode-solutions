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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode
        var curr: ListNode? = head

        while curr != nil {
            if curr!.val == val {
                prev?.next = curr?.next
            } else {
                prev = curr
            }
            curr = curr?.next
        }

        return dummyNode.next
    }
}