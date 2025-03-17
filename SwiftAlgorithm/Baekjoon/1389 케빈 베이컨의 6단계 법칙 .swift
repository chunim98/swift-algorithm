//
//  1389 케빈 베이컨의 6단계 법칙 .swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/17/25.
//

// https://www.acmicpc.net/problem/1389

func problem1389() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1]) // 노드, 간선
    var graph = [[Int]](repeating: [Int](repeating: .max, count: n+1), count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (node1, node2) = (input[0], input[1])
        // 양방향 연결, 거리는 1로 간주
        graph[node1][node2] = 1
        graph[node2][node1] = 1
    }
    
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                guard graph[j][i] != .max, graph[i][k] != .max else { continue }
                
                if j == k { graph[j][k] = 0; continue } // 자신에게 가는 거리 0
                
                graph[j][k] = min(graph[j][k], graph[j][i]+graph[i][k])
            }
        }
    }
    
    // 체이닝이 길어지면 엑스코드 인덱싱이 한세월 걸림;;
    let sums = graph[1...].map { $0[1...].filter { $0 != .max }.reduce(0, +) }
    let tuples = sums.enumerated().map { ($0+1, $1) }
    let result = tuples.min { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }!.0
    print(result)
}
