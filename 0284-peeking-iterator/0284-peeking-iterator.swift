// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    
    private var iterator: IndexingIterator<[Int]>
    private var nextValue: Int?
    
    init(_ iterator: IndexingIterator<[Int]>) {
        self.iterator = iterator
        self.nextValue = self.iterator.next()
    }
    
    func peek() -> Int {
        return nextValue!
    }
    
    func next() -> Int {
        let current = nextValue!
        nextValue = self.iterator.next()
        return current
    }
    
    func hasNext() -> Bool {
        return nextValue != nil
    }
}
/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */