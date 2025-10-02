//
//  2178 미로탐색.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/2/25.
//
// https://www.acmicpc.net/problem/2178

func problem2178() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    var graph = [[0]] + (0..<n).map { _ in [0] + readLine()!.map { Int(String($0))! } }
    
    var queue = [(1, 1)]
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            guard 1...n ~= ny,
                  1...m ~= nx,
                  graph[ny][nx] == 1
            else { continue }
            
            graph[ny][nx] = graph[y][x] + 1
            queue.append((ny, nx))
        }
    }
    
    print(graph[n][m])
}
