class MyCalendar {
    
    private var bookings: [(start: Int, end: Int)] = []
    
    init() {
        
    }
    
    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        
        for booking in bookings {
            
            let existingStart = booking.start
            let existingEnd = booking.end
            
            // Check for overlap
            if startTime < existingEnd &&
               existingStart < endTime {
                return false
            }
        }
        

        bookings.append((startTime, endTime))
        
        return true
    }
}
/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(startTime, endTime)
 */