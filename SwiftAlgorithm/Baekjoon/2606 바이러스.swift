//
//  2606 바이러스.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/4/25.
//
// https://www.acmicpc.net/problem/2606

//func problem2606() {
//    let nodeCnt = Int(readLine()!)!
//    let edgeCnt = Int(readLine()!)!
//    var graph = [[Int]](repeating: [], count: nodeCnt+1)
//    var visit = [Bool](repeating: false, count: nodeCnt+1)
//    var result = 0
//    
//    for _ in 0..<edgeCnt {
//        let input = readLine()!.split(separator: " ").map { Int($0)! }
//        let (a, b) = (input[0], input[1])
//        graph[a].append(b)
//        graph[b].append(a)
//    }
//    
//    var queue = [1]
//    var head = 0
//    visit[1] = true
//    
//    while queue.count > head {
//        let start = queue[head]
//        head += 1
//        
//        for end in graph[start] {
//            guard !visit[end] else { continue }
//            queue.append(end)
//            visit[end] = true
//            result += 1
//        }
//    }
//    
//    print(result)
//}

func problem2606() {
    let nodeCnt = Int(readLine()!)!
    let edgeCnt = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: nodeCnt+1)
    var visit = [Bool](repeating: false, count: nodeCnt+1)
    var result = 0
    
    for _ in 0..<edgeCnt {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (input[0], input[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    func dfs(_ start: Int) {
        guard !visit[start] else { return }
        visit[start] = true
        result += 1
        for end in graph[start] { dfs(end) }
    }
    
    dfs(1)
    print(result-1)
}
