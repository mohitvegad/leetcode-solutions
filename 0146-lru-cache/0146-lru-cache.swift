
class LRUCache {
    
    class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    var capacity: Int
    var map = [Int: Node]()
    
    var head: Node
    var tail: Node
    
    init(_ capacity: Int) {
        self.capacity = capacity
        
        head = Node(0, 0)
        tail = Node(0, 0)
        
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        
        remove(node)
        addToEnd(node)
        
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        
        if let node = map[key] {
            node.value = value
            
            remove(node)
            addToEnd(node)
            
            return
        }
        
        let node = Node(key, value)
        map[key] = node
        addToEnd(node)
        
        if map.count > capacity {
            let leastRecent = head.next!
            
            remove(leastRecent)
            map[leastRecent.key] = nil
        }
    }
    
    func remove(_ node: Node) {
        let previous = node.prev
        let next = node.next
        
        previous?.next = next
        next?.prev = previous
    }
    
    func addToEnd(_ node: Node) {
        let last = tail.prev
        
        last?.next = node
        node.prev = last
        
        node.next = tail
        tail.prev = node
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */