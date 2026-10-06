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
    func addTwoNumbers(
        _ l1: ListNode?,
        _ l2: ListNode?
    ) -> ListNode? {
        
        var stack1 = [Int]()
        var stack2 = [Int]()
        
        var current1 = l1
        var current2 = l2
        
        // Put l1 into stack1
        while let node = current1 {
            stack1.append(node.val)
            current1 = node.next
        }
        
        // Put l2 into stack2
        while let node = current2 {
            stack2.append(node.val)
            current2 = node.next
        }
        
        var carry = 0
        var result: ListNode? = nil
        
        while !stack1.isEmpty || !stack2.isEmpty || carry > 0 {
            
            let value1 = stack1.isEmpty ? 0 : stack1.removeLast()
            let value2 = stack2.isEmpty ? 0 : stack2.removeLast()
            
            let sum = value1 + value2 + carry
            
            let digit = sum % 10
            carry = sum / 10
            
            let node = ListNode(digit)
            node.next = result
            result = node
        }
        
        return result
    }
}