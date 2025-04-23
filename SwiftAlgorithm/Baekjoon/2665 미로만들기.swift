//
//  2665 미로만들기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 4/23/25.
//
// https://www.acmicpc.net/problem/2665

import Foundation

func problem2665() {
    let n = Int(readLine()!)!
    let graph = [[0]] + (0..<n).map { _ in [0] + readLine()!.map { Int(String($0))! == 0 ? 1 : 0 } }
    var visit = [[Int]](repeating: [Int](repeating: .max, count: n+1), count: n+1)
    var queue = [(1, 1)]
        
    let dy = [0, 0, -1, 1]
    let dx = [-1, 1, 0, 0]
    
    visit[1][1] = 0
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
                        
            guard ny <= n,
                  ny > 0,
                  nx <= n,
                  nx > 0,
                  visit[y][x] + graph[ny][nx] < visit[ny][nx]
            else { continue }
            
            visit[ny][nx] = visit[y][x] + graph[ny][nx]
            queue.append((ny, nx))
        }
    }
    
    print(visit[n][n])
}


