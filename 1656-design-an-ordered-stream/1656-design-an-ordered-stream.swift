
class OrderedStream {
    
    var stream: [String?]
    var ptr: Int
    
    init(_ n: Int) {
        stream = Array(repeating: nil, count: n + 1)
        ptr = 1
    }
    
    func insert(_ idKey: Int, _ value: String) -> [String] {
        stream[idKey] = value
        
        var result: [String] = []
        
        while ptr < stream.count, let value = stream[ptr] {
            result.append(value)
            ptr += 1
        }
        
        return result
    }
}
/**
 * Your OrderedStream object will be instantiated and called as such:
 * let obj = OrderedStream(n)
 * let ret_1: [String] = obj.insert(idKey, value)
 */