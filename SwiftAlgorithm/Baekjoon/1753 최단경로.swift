//
//  1753 최단경로.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/4/25.
//
// https://www.acmicpc.net/problem/1753

//func problem1753() {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let (n, m) = (input[0], input[1]) // 노드 수, 엣지 수
//    let start = Int(readLine()!)!
//    
//    var graph = [[(Int, Int)]](repeating: [], count: n+1)
//    var visit = [Bool](repeating: false, count: n+1)
//    var dist = [Int](repeating: .max, count: n+1)
//    
//    for _ in 0..<m {
//        let input = readLine()!.split(separator: " ").map { Int($0)! }
//        let (a, b, c) = (input[0], input[1], input[2])
//        graph[a].append((b, c))
//    }
//    
//    dist[start] = 0
//    
//    for _ in 1...n {
//        let now = (1...n)
//            .filter { !visit[$0] }
//            .min { dist[$0] < dist[$1] }!
//        
//        guard dist[now] != .max else { continue }
//        visit[now] = true
//        
//        for (to, cost) in graph[now] {
//            dist[to] = min(dist[to], dist[now] + cost)
//        }
//    }
//    
//    dist[1...].forEach { print($0 == .max ? "INF" : "\($0)") }
//}

func problem1753() {
    struct MinHeap<T: Comparable> {
        var heap = [T]()
        
        mutating func push(_ value: T) {
            heap.append(value)
            var i = heap.count - 1
            while heap.count > 1, heap[(i-1)/2] > heap[i] {
                heap.swapAt(i, (i-1)/2)
                i = (i-1)/2
            }
        }
        
        mutating func pop() -> T? {
            guard !heap.isEmpty else { return nil }
            if heap.count == 1 { return heap.removeLast() }
            
            let minValue = heap[0]
            heap[0] = heap.removeLast()
            
            var i = 0
            while true {
                let left = 2 * i + 1
                let right = 2 * i + 2
                var smallest = i
                
                if left < heap.count && heap[left] < heap[smallest] { smallest = left }
                if right < heap.count && heap[right] < heap[smallest] { smallest = right }
                if smallest == i { break }
                
                heap.swapAt(i, smallest)
                i = smallest
            }
            
            return minValue
        }
    }
    
    struct Edge: Comparable {
        let node: Int
        let cost: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            lhs.cost < rhs.cost
        }
    }
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1]) // 노드 수, 엣지 수
    let start = Int(readLine()!)!
    
    var graph = [[Edge]](repeating: [], count: n+1)
    var dist = [Int](repeating: .max, count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (input[0], input[1], input[2])
        graph[a].append(.init(node: b, cost: c))
    }

    var queue = MinHeap<Edge>()
    queue.push(.init(node: start, cost: 0))
    dist[start] = 0
    
    while !queue.heap.isEmpty {
        let pre = queue.pop()!
        if pre.cost > dist[pre.node] { continue }
        
        for new in graph[pre.node] {
            guard dist[new.node] > dist[pre.node] + new.cost else { continue }
            
            dist[new.node] = dist[pre.node] + new.cost
            queue.push(.init(node: new.node, cost: dist[new.node]))
        }
    }
    
    dist[1...].forEach { print($0 == .max ? "INF" : "\($0)") }
}
