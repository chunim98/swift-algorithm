//
//  21736 헌내기는 친구가 필요해.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/29/25.
//
// https://www.acmicpc.net/problem/21736

func problem21736() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var graph = [[Character]](repeating: [], count: n+1)
    var queue = [(Int, Int)]()
    var head = 0
    var cnt = 0
    
    let dy = [0, 0, 1, -1]
    let dx = [1, -1, 0, 0]
    
    for y in 1...n {
        graph[y] = [" "] + Array(readLine()!)
        graph[y].firstIndex(of: "I").map { x in queue.append((y, x)) }
    }

    while head < queue.count {
        let (y, x) = queue[head]
        head += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            guard 1...n ~= ny,
                  1...m ~= nx,
                  graph[ny][nx] != "X"
            else { continue }
            
            if graph[ny][nx] == "P" { cnt += 1 }
            graph[ny][nx] = "X"
            queue.append((ny, nx))
        }
    }
    
    print(cnt == 0 ? "TT" : cnt)
}


