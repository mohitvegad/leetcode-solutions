class MyCalendarTwo {
    private var bookings: [(start: Int, end: Int)] = []
    private var overlaps: [(start: Int, end: Int)] = []

    init() {
    }

    func book(_ startTime: Int, _ endTime: Int) -> Bool {

        for overlap in overlaps {
            if startTime < overlap.end &&
               overlap.start < endTime {
                return false
            }
        }

        for booking in bookings {
            if startTime < booking.end &&
               booking.start < endTime {

                let overlapStart = max(startTime, booking.start)
                let overlapEnd = min(endTime, booking.end)

                overlaps.append(
                    (overlapStart, overlapEnd)
                )
            }
        }

        bookings.append((startTime, endTime))

        return true
    }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * let obj = MyCalendarTwo()
 * let ret_1: Bool = obj.book(startTime, endTime)
 */