//
//  1003 피보나치 함수.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/8/25.
//

// https://www.acmicpc.net/problem/1003

func problem1003() {
    let t = Int(readLine()!)!
    
    func dp() {
        let n = Int(readLine()!)! // 0...40
        if n == 0 { print(1, 0); return }
        if n == 1 { print(0, 1); return }
        
        var dp = [(Int, Int)](repeating: (0, 0), count: n+1)
        dp[0] = (1, 0)
        dp[1] = (0, 1)
        
        for i in 2...n {
            dp[i] = (
                dp[i-1].0 + dp[i-2].0,
                dp[i-1].1 + dp[i-2].1
            )
        }
        
        print(dp[n].0, dp[n].1)
    }
    
    for _ in 0..<t { dp() }
}
