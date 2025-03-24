//
//  1904 01타일.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/24/25.
//
// https://www.acmicpc.net/problem/1904

func problem1904() {
    func dp() -> Int {
        let n = Int(readLine()!)!
        var dp = [Int](repeating: 0, count: n+1)
        
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n { dp[i] = (dp[i-1]+dp[i-2]) % 15746 }

        return dp[n]
    }
    
    print(dp())
}

