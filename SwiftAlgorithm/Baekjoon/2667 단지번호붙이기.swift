//
//  2667 단지번호붙이기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/12/25.
//

// https://www.acmicpc.net/problem/2667

func problem2667() {
    let n = Int(readLine()!)!
    var graph = (0..<n).map { _ in readLine()!.map { Int(String($0))! } }
    var cycle = 1 // 0, 1은 사용 불가, 2부터 카운트
    
    let dy = [0, 0, 1, -1]
    let dx = [1, -1, 0, 0]
    
    func dfs(_ y: Int, _ x: Int) {
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            guard ny < n,
                  ny >= 0,
                  nx < n,
                  nx >= 0,
                  graph[ny][nx] == 1
            else { continue }
            
            graph[ny][nx] = cycle
            dfs(ny, nx)
        }
    }
    
    for y in 0..<n {
        for x in 0..<n {
            guard graph[y][x] == 1 else { continue }
            cycle += 1
            graph[y][x] = cycle
            dfs(y, x)
        }
    }
    
    let result = (2...cycle)
        .map { i in graph.reduce(0) { $0 + ($1.filter { $0 == i }.count) } }
        .sorted()
    
    print(cycle-1)
    result.forEach { print($0) }
}
