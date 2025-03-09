//
//  11404 플로이드.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/9/25.
//

// https://www.acmicpc.net/problem/11404

func problem11404() {
    let n = Int(readLine()!)! // 노드
    let m = Int(readLine()!)! // 간선
    var graph = [[Int]](repeating: [Int](repeating: .max, count: n+1), count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (input[0], input[1], input[2]) // 출발, 도착, 비용
        graph[a][b] = min(graph[a][b], c) // 같은 노선이 있을 수 있음
    }
    
    for k in 1...n {
        graph[k][k] = 0 // 자신에게 가는 비용은 0
        
        for i in 1...n {
            for j in 1...n {
                guard graph[i][k] != .max, graph[k][j] != .max else { continue }
                graph[i][j] = min(graph[i][j], graph[i][k]+graph[k][j])
            }
        }
    }
    
    graph[1...].forEach {
        print($0[1...].map { $0 == .max ? "0" : String($0) }.joined(separator: " "))
    }
}
