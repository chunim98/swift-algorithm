//
//  15988 1, 2, 3 더하기 3.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/21/25.
//
// https://www.acmicpc.net/problem/15988

func problem15988() {
    var dp = [.min, 1, 2, 4]
    
    func doDP() -> Int {
        let n = Int(readLine()!)!
        
        if n < dp.count { return dp[n] }
        
        for n in dp.count...n {
            dp.append((dp[n-1] + dp[n-2] + dp[n-3]) % 1000000009)
        }
        return dp.last!
    }
    
    for _ in 0..<Int(readLine()!)! { print(doDP()) }
}
