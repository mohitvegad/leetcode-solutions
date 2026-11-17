
class Solution {

    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {

        var adj = Array(repeating: [[Int]](), count: n)

        for flight in flights {
            adj[flight[0]].append([flight[1], flight[2]])
        }

        var pq = [[Int]]()
        pq.append([0, src, 0])

        var best = Array(
            repeating: Array(repeating: Int.max, count: k + 2),
            count: n
        )

        best[src][0] = 0

        while !pq.isEmpty {

            // Find and remove the entry with minimum cost
            let minIndex = pq.indices.min {
                pq[$0][0] < pq[$1][0]
            }!

            let curr = pq.remove(at: minIndex)

            let cost = curr[0]
            let city = curr[1]
            let stops = curr[2]

            if city == dst {
                return cost
            }

            if stops == k + 1 {
                continue
            }

            for edge in adj[city] {

                let nextCity = edge[0]
                let price = edge[1]
                let newCost = cost + price
                let newStops = stops + 1

                if newCost < best[nextCity][newStops] {

                    best[nextCity][newStops] = newCost

                    pq.append([newCost, nextCity, newStops])
                }
            }
        }

        return -1
    }
}
