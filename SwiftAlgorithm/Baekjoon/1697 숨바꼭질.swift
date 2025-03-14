//
//  1697 숨바꼭질.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/14/25.
//

// https://www.acmicpc.net/problem/1697

// DP 풀이
func problem1697() {
    func dp() -> Int {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, k) = (input[0], input[1])
        var dp = [Int](repeating: 0, count: k+1)
        
        // 둘이 같은 위치에 있으면 0 리턴
        // 동생보다 앞서있는 경우엔 후진밖에 못함
        guard n < k else { return n - k }
        
        // n에서 0가는 경우도 후진밖에 없음
        for i in stride(from: n, through: 0, by: -1) { dp[i] = n - i }
        
        for i in (n+1)...k {
            if i % 2 == 0 {
                dp[i] = min(
                    dp[i / 2] + 1,
                    dp[i - 1] + 1
                )
            } else {
                dp[i] = min(
                    dp[(i+1) / 2] + 2, // 2배 점프 후, 후진이기 때문에 2번 움직임
                    dp[i - 1] + 1
                )
            }
        }
        
        return dp[k]
    }
    
    print(dp())
}

// BFS 풀이
//func bfs() -> Int {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let (n, k) = (input[0], input[1])
//    var dist = [Int](repeating: .max, count: k*2+1)
//    var queue = [n]
//    
//    // 둘이 같은 위치에 있으면 0 리턴
//    // 동생보다 앞서있는 경우엔 후진밖에 못함
//    guard n < k else { return n - k }
//
//    dist[n] = 0 // 시작 노드 거리 0
//    
//    while !queue.isEmpty {
//        let a = queue.removeFirst()
//        
//        [a+1, a-1, a*2].forEach { b in
//            guard b < k * 2,
//                  b >= 0,
//                  dist[a]+1 < dist[b]
//            else { return }
//            
//            dist[b] = dist[a] + 1
//            queue.append(b)
//        }
//    }
//    
//    return dist[k]
//}
