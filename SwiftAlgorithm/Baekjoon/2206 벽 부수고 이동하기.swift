//
//  2206 벽 부수고 이동하기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 4/23/25.
//
// https://www.acmicpc.net/problem/2206

func problem2206() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    var graph = [[Int]](repeating: [0], count: n+1)
    var visit = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    var queue = [(1, 1)]
    
    let dy = [0, 0, -1, 1]
    let dx = [-1, 1, 0, 0]
    
    func direct(_ y: Int, _ x: Int) {
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny <= n,
                  ny > 0,
                  nx <= m,
                  nx > 0
            else { continue }
            
            visit[ny][nx] = visit[y][x] + 2
            queue.append((y, x))
        }
    }
    
    for i in 1...n {
        graph[i] += readLine()!.map { Int(String($0))! }
    }
    
    visit[1][1] = 1
        
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x

            guard ny <= n,
                  ny > 0,
                  nx <= m,
                  nx > 0
            else { continue }
            
            if graph[ny][nx] == 0 {
                visit[ny][nx] = visit[y][x] + 1
                queue.append((y, x))
                
            } else {
                direct(y, x)
            }
        }
    }
    
    print(visit[n][m])
}
