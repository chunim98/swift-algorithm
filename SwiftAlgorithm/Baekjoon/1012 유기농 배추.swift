//
//  1012 유기농 배추.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/8/25.
//

// https://www.acmicpc.net/problem/1012

func problem1012() {
    let t = Int(readLine()!)!
    
    func dfsSolution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (m, n, k) = (input[0], input[1], input[2]) // 가로, 세로, 배추 위치 개수
        var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var result = 0
        
        // 그래프 그리기
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (x, y) = (input[0], input[1])
            graph[x][y] = 1
        }
        
        // 깊이 우선 탐색의 재귀 함수
        func dfs(_ x: Int, _ y: Int) {
            let dx = [1, -1, 0, 0]
            let dy = [0, 0, 1, -1]
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                guard nx < m,
                      nx >= 0,
                      ny < n,
                      ny >= 0,
                      graph[nx][ny] == 1
                else { continue }
                
                graph[nx][ny] = 0 // 방문 처리
                dfs(nx, ny)
            }
        }
        
        // 시작 가능한 노드 탐색
        for x in 0..<m {
            for y in 0..<n {
                guard graph[x][y] == 1 else { continue }
                graph[x][y] = 0 // 시작 노드 방문처리
                result += 1
                dfs(x, y)
            }
        }
        
        // 결과 출력
        print(result)
    }

    // 케이스 개수만큼 실행
    for _ in 0..<t { dfsSolution() }
}

// MARK: BFS

//func problem1012() {
//    let t = Int(readLine()!)!
//    
//    for _ in 0..<t {
//        let input = readLine()!.split(separator: " ").map { Int($0)! }
//        let (m, n, k) = (input[0], input[1], input[2]) // 가로 세로 배추갯수
//        
//        var graph = [[Int]](repeating: .init(repeating: 0, count: m), count: n)
//        
//        for _ in 0..<k {
//            let input = readLine()!.split(separator: " ").map { Int($0)! }
//            let (x, y) = (input[0], input[1])
//            graph[y][x] = 1
//        }
//        
//        func bfs(x: Int, y: Int) {
//            var queue = [(x, y)]
//            
//            let dx = [1, -1, 0, 0]
//            let dy = [0, 0, 1, -1]
//            
//            while !queue.isEmpty {
//                let (x, y) = queue.removeFirst()
//                
//                for i in 0..<4 {
//                    let nx = x + dx[i]
//                    let ny = y + dy[i]
//                    
//                    guard nx >= 0,
//                          nx < m,
//                          ny >= 0,
//                          ny < n,
//                          graph[ny][nx] == 1
//                    else { continue }
//                    
//                    queue.append((nx, ny))
//                    graph[ny][nx] = 0
//                }
//            }
//        }
//        
//        var result = 0
//        
//        for y in 0..<n {
//            for x in 0..<m {
//                guard graph[y][x] == 1 else { continue }
//                result += 1
//                bfs(x: x, y: y)
//            }
//        }
//        
//        print(result)
//    }
//}
