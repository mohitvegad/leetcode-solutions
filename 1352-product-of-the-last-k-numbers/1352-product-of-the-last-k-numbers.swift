class ProductOfNumbers {
    
    var prefix: [Int] = [1]
    
    init() {
        
    }
    
    func add(_ num: Int) {
        
        if num == 0 {
            prefix = [1]
        } else {
            let last = prefix.last!
            prefix.append(last * num)
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        
        if k >= prefix.count {
            return 0
        }
        
        return prefix.last! / prefix[prefix.count - 1 - k]
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */