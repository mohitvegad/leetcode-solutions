class DataStream {
    private let value: Int
    private let k: Int
    private var count = 0

    init(_ value: Int, _ k: Int) {
        self.value = value
        self.k = k
    }

    func consec(_ num: Int) -> Bool {
        if num == value {
            count += 1
        } else {
            count = 0
        }

        return count >= k
    }
}
/**
 * Your DataStream object will be instantiated and called as such:
 * let obj = DataStream(value, k)
 * let ret_1: Bool = obj.consec(num)
 */