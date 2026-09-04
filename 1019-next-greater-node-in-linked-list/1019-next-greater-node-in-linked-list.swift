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
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var values: [Int] = []
        
        var current = head
        
        while let node = current {
            values.append(node.val)
            current = node.next
        }
        
        var answer = Array(repeating: 0, count: values.count)
        var stack: [(index: Int, value: Int)] = []
        
        for i in 0..<values.count {
            while let last = stack.last, values[i] > last.value {
                answer[last.index] = values[i]
                stack.removeLast()
            }
            
            stack.append((i, values[i]))
        }
        
        return answer
    }
}