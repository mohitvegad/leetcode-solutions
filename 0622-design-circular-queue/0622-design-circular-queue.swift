
class MyCircularQueue {

    var array: [Int]
    var front: Int
    var rear: Int
    var count: Int
    let capacity: Int

    init(_ k: Int) {
        capacity = k
        array = Array(repeating: -1, count: k)
        front = 0
        rear = -1
        count = 0
    }

    func enQueue(_ value: Int) -> Bool {

        if isFull() {
            return false
        }

        rear = (rear + 1) % capacity
        array[rear] = value
        count += 1

        return true
    }

    func deQueue() -> Bool {

        if isEmpty() {
            return false
        }

        front = (front + 1) % capacity
        count -= 1

        return true
    }

    func Front() -> Int {
        if isEmpty() {
            return -1
        }

        return array[front]
    }

    func Rear() -> Int {
        if isEmpty() {
            return -1
        }

        return array[rear]
    }

    func isEmpty() -> Bool {
        return count == 0
    }

    func isFull() -> Bool {
        return count == capacity
    }
}
