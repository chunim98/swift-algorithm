//
//  2133 타일 채우기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/23/25.
//
// https://www.acmicpc.net/problem/2133

func problem2133() {
    func dp() -> Int {
        let n = Int(readLine()!)!
        var dp = [Int](repeating: 0, count: n+1)

        guard n % 2 == 0 else { return 0 }
        
        dp[2] = 3
        
        for i in stride(from: 4, through: n, by: 2) {
            dp[i] = dp[i-2] * dp[2]
            for j in stride(from: i-4, through: 0, by: -2) { dp[i] += dp[j] * 2 }
            dp[i] += 2
        }
        
        return dp[n/2*2]
    }
    
    print(dp())
}

// 어려운 문제였기에, 풀이 첨부함
// https://fre2-dom.tistory.com/460
// https://yabmoons.tistory.com/536
// https://blog.naver.com/ajy7424/222608567553
