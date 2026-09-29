
class SnapshotArray {

    private var snapshots: [[(snapID: Int, value: Int)]]
    private var currentSnapID = 0

    init(_ length: Int) {
        snapshots = Array(
            repeating: [],
            count: length
        )
    }

    func set(_ index: Int, _ val: Int) {
        snapshots[index].append(
            (currentSnapID, val)
        )
    }

    func snap() -> Int {
        let id = currentSnapID
        currentSnapID += 1
        return id
    }

    func get(_ index: Int, _ snap_id: Int) -> Int {

        let history = snapshots[index]

        var left = 0
        var right = history.count - 1
        var answer = 0

        while left <= right {

            let middle = left + (right - left) / 2

            if history[middle].snapID <= snap_id {
                answer = history[middle].value
                left = middle + 1
            } else {
                right = middle - 1
            }
        }

        return answer
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */