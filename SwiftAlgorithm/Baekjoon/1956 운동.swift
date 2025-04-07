//
//  1956 운동.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 4/7/25.
//
// https://www.acmicpc.net/problem/1956

func problem1956() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, m) = (input[0], input[1]) // 노드, 엣지
    var graph = [[Int]](repeating: [Int](repeating: .max, count: v+1), count: v+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (input[0], input[1], input[2]) // 출발, 도착, 거리
        graph[a][b] = c
    }
    
    for i in 1...v {
        // 사이클이 만들어져야 하므로 자신에게 가는 거리를 0으로 초기화하지 않음
        for j in 1...v {
            for k in 1...v {
                guard graph[j][i] != .max, graph[i][k] != .max else { continue }
                graph[j][k] = min(graph[j][k], graph[j][i]+graph[i][k])
            }
        }
    }
    
    let minValue = Array(1...v)
        .map { graph[$0][$0] }
        .min()!
    
    print(minValue == .max ? -1 : minValue)
}
