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
    var dic = [Int : Int]()
    var graph = [Int](repeating: .max, count: 100+1)
    var queue = [Int]()
    
    // 뱀, 사다리 추가
    for _ in 0..<n+m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        dic[input[0]] = input[1]
    }
    
    graph[1] = 0
    queue = [1]
    
    while !queue.isEmpty {
        let x = queue.removeFirst()
        
        for i in 1...6 {
            let nx = x + i
            
            guard nx <= 100, graph[nx] > graph[x]+1 else { continue }
            
            if let nnx = dic[nx] {
                // 사다리나 뱀이 현재 노드에 있는 경우
                // 방문 가능 여부 상관없이, 일단 사다리나 뱀이 있으면 타고 가야함
                guard graph[nnx] > graph[x]+1 else { continue }
                graph[nnx] = graph[x] + 1
                queue.append(nnx)
                
            } else {
                // 해당 사항 없을 경우, 정상 진행
                graph[nx] = graph[x] + 1
                queue.append(nx)
            }
        }
    }
    
    print(graph[100])
}
