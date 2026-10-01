class Solution {
    func canFinish(
        _ numCourses: Int,
        _ prerequisites: [[Int]]
    ) -> Bool {
        
        var graph = Array(
            repeating: [Int](),
            count: numCourses
        )
        
        var indegree = Array(
            repeating: 0,
            count: numCourses
        )
        
        // Build graph
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let prerequisiteCourse = prerequisite[1]
            
            graph[prerequisiteCourse].append(course)
            indegree[course] += 1
        }
        
        // Find courses with no prerequisites
        var queue = [Int]()
        
        for course in 0..<numCourses {
            if indegree[course] == 0 {
                queue.append(course)
            }
        }
        
        var completedCourses = 0
        var index = 0
        
        // BFS
        while index < queue.count {
            
            let course = queue[index]
            index += 1
            
            completedCourses += 1
            
            for nextCourse in graph[course] {
                indegree[nextCourse] -= 1
                
                if indegree[nextCourse] == 0 {
                    queue.append(nextCourse)
                }
            }
        }
        
        return completedCourses == numCourses
    }
}