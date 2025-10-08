//
//  11404 플로이드.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/9/25.
//
// https://www.acmicpc.net/problem/11404

func problem11404() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph = [[Int]](repeating: .init(repeating: .max, count: n+1), count: n+1)
    
    for i in 1...n { graph[i][i] = 0 }
    
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (abc[0], abc[1], abc[2])
        graph[a][b] = min(c, graph[a][b])
    }
    
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                guard graph[j][i] != .max, graph[i][k] != .max else { continue }
                graph[j][k] = min(graph[j][k], graph[j][i] + graph[i][k])
            }
        }
    }
    
    graph[1...].forEach {
        print($0[1...].map { $0 == .max ? "0" : "\($0)" }.joined(separator: " "))
    }
}
