//
//  7576 토마토.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/2/25.
//
// https://www.acmicpc.net/problem/7576

func problem7576() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n) = (input[0], input[1])
    var graph = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    
    var queue = [(Int, Int)]()
    var head = 0
    var total = m * n   // 전체 토마토 개수
    var days = 0        // 익는 데 걸린 날짜
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 { queue.append((i, j)) }
            if graph[i][j] == -1 { total -= 1 }
        }
    }
    
    while queue.count > head {
        let (y, x) = queue[head]
        head += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            guard 0..<n ~= ny,
                  0..<m ~= nx,
                  graph[ny][nx] == 0
            else { continue }
            
            queue.append((ny, nx))
            graph[ny][nx] = graph[y][x] + 1
            days = max(graph[ny][nx], days)
        }
    }
    
    
    total == queue.count // 큐 크기가 결국 익은 토마토 개수
    ? print(max(days-1, 0))
    : print(-1)
}
