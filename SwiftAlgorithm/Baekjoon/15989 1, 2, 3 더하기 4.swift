//
//  15989 1, 2, 3 더하기 4.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 4/18/25.
//
// https://www.acmicpc.net/problem/15989

func problem15989() {
    func dp() -> Int {
        let n = Int(readLine()!)!
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n+1)
        
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        if n == 3 { return 3 }
        
        dp[1][1] = 1
        dp[2][1] = 1
        dp[2][2] = 1
        dp[3][1] = 1
        dp[3][2] = 1
        dp[3][3] = 1
        
        for i in 4...n {
            dp[i][1] = dp[i-1][1] // 구성요소가 1로 끝나는 경우
            dp[i][2] = dp[i-2][1] + dp[i-2][2] // 구성요소가 2로 끝나는 경우
            dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3] // 구성요소가 3로 끝나는 경우
        }
        
        return dp[n].reduce(0, +)
    }
    
    let t = Int(readLine()!)!
    (0..<t).map { _ in dp() }.forEach { print($0) }
}
