//
//  1260 DFS와 BFS.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/28/25.
//
// https://www.acmicpc.net/problem/1260

func problem1260() {
    let nmv = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, v) = (nmv[0], nmv[1], nmv[2]) // 노드수, 엣지수, 시작노드
    var graph = [[Int]](repeating: [], count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (start, end) = (input[0], input[1])
        graph[start].append(end)
        graph[end].append(start)
    }
    
    // DFS
    var visit = [Bool](repeating: false, count: n+1)
    var dfsAns = [String]()
    
    func dfs(_ now: Int) {
        guard !visit[now] else { return }
        dfsAns.append("\(now)")
        visit[now] = true
        for new in graph[now].sorted() { dfs(new) }
    }
    
    dfs(v)
    
    // BFS
    visit = [Bool](repeating: false, count: n+1)
    var queue = [v]
    var head = 0
    var bfsAns = [String]()
    
    while head < queue.count {
        let now = queue[head]
        head += 1
        
        guard !visit[now] else { continue }
        bfsAns.append("\(now)")
        visit[now] = true
        for new in graph[now].sorted() { queue.append(new) }
    }
    
    print(dfsAns.joined(separator: " "))
    print(bfsAns.joined(separator: " "))
}
