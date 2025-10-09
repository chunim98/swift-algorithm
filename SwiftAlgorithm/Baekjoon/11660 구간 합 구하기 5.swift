//
//  11660 구간 합 구하기 5.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/9/25.
//
// https://www.acmicpc.net/problem/11660

func problem11660() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var graph = [[Int]](repeating: [], count: n+1)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph[i] = [0] + input
    }
    
    for i in 1...n {
        for j in 1...n {
            dp[i][j] = graph[i][j] + dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1]
        }
    }
    
    for _ in 0..<m {
        let xxyy = readLine()!.split(separator: " ").map { Int($0)! }
        let (x1, y1, x2, y2) = (xxyy[0], xxyy[1], xxyy[2], xxyy[3])
        let result = dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1]
        print(result)
    }
}
