//
//  11725 트리의 부모 찾기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/9/25.
//
// https://www.acmicpc.net/problem/11725

func problem11725() {
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n+1)
    var parent = [Int](repeating: 0, count: n+1)
    
    for _ in 0..<(n-1) {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (ab[0], ab[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var queue = [1]
    var head = 0
    
    while head < queue.count {
        let now = queue[head]
        head += 1
        
        for next in graph[now] {
            guard parent[next] == 0 else { continue }
            parent[next] = now
            queue.append(next)
        }
    }
    
    parent[2...].forEach { print($0) }
}
