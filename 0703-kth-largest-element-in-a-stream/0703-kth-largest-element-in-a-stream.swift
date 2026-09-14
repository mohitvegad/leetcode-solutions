class KthLargest {
    var heap: [Int] = []
    let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k

        for num in nums {
            add(num)
        }
    }

    func add(_ val: Int) -> Int {
        // Add number
        heap.append(val)

        // Move it up
        var index = heap.count - 1

        while index > 0 {
            let parent = (index - 1) / 2

            if heap[parent] <= heap[index] {
                break
            }

            heap.swapAt(parent, index)
            index = parent
        }

        // Keep only k numbers
        if heap.count > k {
            removeMin()
        }

        // kth largest
        return heap[0]
    }

    func removeMin() {
        heap[0] = heap[heap.count - 1]
        heap.removeLast()

        var index = 0

        while true {
            let left = index * 2 + 1
            let right = index * 2 + 2

            var smallest = index

            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }

            if right < heap.count && heap[right] < heap[smallest] {
                smallest = right
            }

            if smallest == index {
                break
            }

            heap.swapAt(index, smallest)
            index = smallest
        }
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */