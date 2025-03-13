//
//  1149 RGB거리.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/13/25.
//

// https://www.acmicpc.net/problem/1149

func problem1149() {
    
    /// 조건 요약:
    /// 인접한 집은 색이 같으면 안됨
    ///
    /// 풀이 요약:
    /// 예를 들어 i번째에 R을 선택했다면, i-1번째에는 G와 B 둘 중 가장 작은 쪽을 선택했을 것임.
    /// 이 아이디어로 점화식 만들면 됨
    
    let n = Int(readLine()!)!
    var cost = [[Int]](repeating: [], count: n+1)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)
    
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        cost[i] = [input[0], input[1], input[2]] // R, G, B
    }
    
    dp[1] = cost[1]
    
    for i in 2...n {
        dp[i][0] = cost[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = cost[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = cost[i][2] + min(dp[i-1][0], dp[i-1][1])
    }
    
    print(dp[n].min()!)
}
