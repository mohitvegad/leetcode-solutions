
class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {

        var adj = Array(repeating: [[Int]](), count: n)

        for flight in flights {
            let from = flight[0]
            let to = flight[1]
            let price = flight[2]

            adj[from].append([to, price])
        }

        var dist = Array(repeating: Int.max, count: n)
        dist[src] = 0

        var queue = [[Int]]()
        queue.append([src, 0])

        var stops = 0
        var index = 0

        while index < queue.count && stops <= k {

            let size = queue.count - index

            for _ in 0..<size {

                let current = queue[index]
                index += 1

                let city = current[0]
                let price = current[1]

                for edge in adj[city] {

                    let nextCity = edge[0]
                    let ticketPrice = edge[1]

                    let newPrice = price + ticketPrice

                    if newPrice < dist[nextCity] {
                        dist[nextCity] = newPrice
                        queue.append([nextCity, newPrice])
                    }
                }
            }

            stops += 1
        }

        return dist[dst] == Int.max ? -1 : dist[dst]
    }
}
