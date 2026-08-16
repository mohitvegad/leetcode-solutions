class Twitter {
    
    struct Tweet {
        let id: Int
        let time: Int
    }
    
    struct HeapNode {
        let tweet: Tweet
        let userId: Int
        let index: Int
    }
    
    var following: [Int: Set<Int>] = [:]
    var tweets: [Int: [Tweet]] = [:]
    var time = 0
    
    init() {}
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        time += 1
        
        tweets[userId, default: []].append(
            Tweet(id: tweetId, time: time)
        )
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        
        var heap: [HeapNode] = []
        var result: [Int] = []
        
        // User always sees their own tweets
        var users = following[userId] ?? []
        users.insert(userId)
        
        // Put the newest tweet from each user into heap
        for user in users {
            if let userTweets = tweets[user], !userTweets.isEmpty {
                let index = userTweets.count - 1
                
                heap.append(
                    HeapNode(
                        tweet: userTweets[index],
                        userId: user,
                        index: index
                    )
                )
            }
        }
        
        buildMaxHeap(&heap)
        
        // Get at most 10 newest tweets
        while !heap.isEmpty && result.count < 10 {
            
            let node = removeMax(&heap)
            result.append(node.tweet.id)
            
            // Get the previous tweet from the same user
            if node.index > 0 {
                let newIndex = node.index - 1
                let tweet = tweets[node.userId]![newIndex]
                
                insert(
                    HeapNode(
                        tweet: tweet,
                        userId: node.userId,
                        index: newIndex
                    ),
                    into: &heap
                )
            }
        }
        
        return result
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
    
    // MARK: - Max Heap
    
    func buildMaxHeap(_ heap: inout [HeapNode]) {
        if heap.count <= 1 {
            return
        }
        
        for i in stride(from: heap.count / 2 - 1, through: 0, by: -1) {
            heapifyDown(&heap, from: i)
        }
    }
    
    func insert(_ node: HeapNode, into heap: inout [HeapNode]) {
        heap.append(node)
        
        var index = heap.count - 1
        
        while index > 0 {
            let parent = (index - 1) / 2
            
            if heap[parent].tweet.time >= heap[index].tweet.time {
                break
            }
            
            heap.swapAt(parent, index)
            index = parent
        }
    }
    
    func removeMax(_ heap: inout [HeapNode]) -> HeapNode {
        let result = heap[0]
        
        if heap.count == 1 {
            heap.removeLast()
            return result
        }
        
        heap[0] = heap.removeLast()
        heapifyDown(&heap, from: 0)
        
        return result
    }
    
    func heapifyDown(_ heap: inout [HeapNode], from index: Int) {
        var current = index
        
        while true {
            let left = current * 2 + 1
            let right = current * 2 + 2
            
            var largest = current
            
            if left < heap.count &&
                heap[left].tweet.time > heap[largest].tweet.time {
                largest = left
            }
            
            if right < heap.count &&
                heap[right].tweet.time > heap[largest].tweet.time {
                largest = right
            }
            
            if largest == current {
                break
            }
            
            heap.swapAt(current, largest)
            current = largest
        }
    }
}
/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */