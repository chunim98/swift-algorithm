//
//  16928 뱀과 사다리 게임 .swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/19/25.
//

// https://www.acmicpc.net/problem/16928

func problem16928() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1]) // 사다리, 뱀
    var ladder = [Int : Int]()
    var snake = [Int : Int]()
    var graph = [Int](repeating: .max, count: 100+1)
    var queue = [Int]()

    // 사다리 추가
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (x, y) = (input[0], input[1])
        ladder[x] = y
    }
    
    // 뱀 추가
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v) = (input[0], input[1])
        snake[u] = v
    }
    
    graph[1] = 0
    queue = [1]
        
    while !queue.isEmpty {
        let x = queue.removeFirst()

        for i in 1...6 {
            let nx = x + i
            
            guard nx <= 100, graph[nx] > graph[x] + 1 else { continue }
                     
            // 사다리나 뱀이 현재 노드에 있으면, 도착 노드도 거리 갱신
            if let lx = ladder[nx] {
                // 방문 가능 여부 상관없이 일단 사다리가 있으면 타고 와야함
                guard graph[lx] > graph[x] + 1 else { continue }
                graph[lx] = graph[x] + 1
                queue.append(lx)
                continue
            }
            if let sx = snake[nx] {
                // 방문 가능 여부 상관없이 일단 뱀이 있으면 타고 와야함
                guard graph[sx] > graph[x] + 1 else { continue }
                graph[sx] = graph[x] + 1
                queue.append(sx)
                continue
            }
            
            // 해당 사항 없을 경우 정상 진행
            graph[nx] = graph[x] + 1
            queue.append(nx)
         }
    }
    
    print(graph[100])
}
