//
//  9461 파도반 수열.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/21/25.
//
// https://www.acmicpc.net/problem/9461

func problem9461() {
    func doDP() {
        var dp = [.min, 1, 1, 1, 2, 2]
        let n = Int(readLine()!)!
        
        if n < dp.count { print(dp[n]); return }
        
        for n in 6...n { dp.append(dp[n-1] + dp[n-5]) }
        
        print(dp.last!)
    }

    for _ in 0..<Int(readLine()!)! { doDP() }
}
