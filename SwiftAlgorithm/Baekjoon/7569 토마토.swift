//
//  7569 토마토.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/20/25.
//
// https://www.acmicpc.net/problem/7569

func problem7569() {
    let nmh = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, h) = (nmh[0], nmh[1], nmh[2]) // 가로, 세로, 높이
    var graph = [[[Int]]](repeating: [[Int]](repeating: [], count: n+1), count: h+1)
    
    var queue = [(z: Int, y: Int, x: Int)]()
    var head = 0
    
    var total = m * n * h
    var days = 1
    
    for z in 1...h {
        for y in 1...n {
            let row = readLine()!.split(separator: " ").map { Int($0)! }
            graph[z][y] = [0] + row
            
            for x in 1...m  {
                if graph[z][y][x] == 1 { queue.append((z, y, x)) }
                if graph[z][y][x] == -1 { total -= 1 }
            }
        }
    }
    
    let dz = [0, 0, 0, 0, 1, -1]
    let dy = [0, 0, 1, -1, 0, 0]
    let dx = [1, -1, 0, 0, 0, 0]
    
    while head < queue.count {
        let (z, y, x) = queue[head]
        head += 1
        
        for i in 0..<6 {
            let nz = z + dz[i]
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            guard 1...h ~= nz,
                  1...n ~= ny,
                  1...m ~= nx,
                  graph[nz][ny][nx] == 0
            else { continue }
            
            graph[nz][ny][nx] = graph[z][y][x] + 1
            days = max(days, graph[nz][ny][nx])
            queue.append((nz, ny, nx))
        }
    }
    
    queue.count == total ? print(days-1) : print(-1)
}
