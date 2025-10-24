//
//  11053 가장 긴 증가하는 부분 수열.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/24/25.
//
// https://www.acmicpc.net/problem/11053

/// i번째 원소를 기준으로 이전 원소들을 확인함.
/// a[j] < a[i]인 경우, j에서 이어붙일 수 있으므로 dp[i] 갱신.
func problem11053() {
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = [Int](repeating: 0, count: n+1)
    
    for i in 0..<n {
        dp[i] = 1 // 자기 자신만 포함하는 경우
        for j in 0..<i {
            if a[i] > a[j] { dp[i] = max(dp[j]+1, dp[i]) }
        }
    }
    
    print(dp.max()!)
}
