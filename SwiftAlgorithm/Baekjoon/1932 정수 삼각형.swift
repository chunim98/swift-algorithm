//
//  1932 정수 삼각형.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/21/25.
//

// https://www.acmicpc.net/problem/1932

func problem1932() {
    
    // DP 풀이
    func dp() -> Int {
        let n = Int(readLine()!)!
        var dp = [[Int]](repeating: [0], count: n+1)
        
        for i in 1...n {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            dp[i].append(contentsOf: input)
        }
        
        guard n != 1 else { return dp[1][1] }
        
        for i in 2...n {
            for j in 1...i {
                if j == 1 { dp[i][j] += dp[i-1][j]; continue }
                if j == i { dp[i][j] += dp[i-1][j-1]; continue }
                dp[i][j] += max(dp[i-1][j-1], dp[i-1][j])
            }
        }
        
        return dp.last!.max()!
    }
    
    print(dp())
    
//    // BFS 풀이
//    let n = Int(readLine()!)!
//    let graph = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
//    var visit = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//    var queue = [(Int, Int)]()
//    
//    visit[0][0] = graph[0][0]
//    queue = [(0, 0)]
//    
//    while !queue.isEmpty {
//        let (a, b) = queue.removeFirst()
//        
//        for (na, nb) in [(a+1, b), (a+1, b+1)] {
//            guard
//                na < n,
//                nb <= na,
//                visit[na][nb] < visit[a][b] + graph[na][nb]
//            else { continue }
//            
//            visit[na][nb] = visit[a][b] + graph[na][nb]
//            queue.append((na, nb))
//        }
//    }
//    
//    print(visit.last!.max()!)
}
