//
//  10026 적록색약.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/12/25.
//

// https://www.acmicpc.net/problem/10026

func problem10026() {
    let n = Int(readLine()!)!
    var graph = (0..<n).map { _ in readLine()!.map { String($0) } }
    var graphWeak = graph.map { $0.map { !($0 == "B") } } // B 제외한 영역 true 처리
    var rgb = ["R" : 0, "G" : 0, "B" : 0, "RG": 0]
    
    let dy = [0, 0, 1, -1]
    let dx = [1, -1, 0, 0]
    
    // R, G, B 탐색
    func bfs(_ y: Int, _ x: Int, _ color: String) {
        var queue = [(y, x)]
        
        while !queue.isEmpty {
            let (y, x) = queue.removeFirst()
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                guard ny < n,
                      ny >= 0,
                      nx < n,
                      nx >= 0,
                      graph[ny][nx] == color
                else { continue }
                
                graph[ny][nx] = "-"
                queue.append((ny, nx))
            }
        }
    }

    for color in ["R", "G", "B"] {
        for y in 0..<n {
            for x in 0..<n {
                guard graph[y][x] == color else { continue }
                rgb[color]! += 1
                bfs(y, x, color)
            }
        }
    }
    
    // RG(B를 제외한 영역) 탐색
    func bfsWeak(_ y: Int, _ x: Int) {
        var queue = [(y, x)]
        
        while !queue.isEmpty {
            let (y, x) = queue.removeFirst()
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                guard ny < n,
                      ny >= 0,
                      nx < n,
                      nx >= 0,
                      graphWeak[ny][nx] == true
                else { continue }
                
                graphWeak[ny][nx] = false
                queue.append((ny, nx))
            }
        }
    }
    
    for y in 0..<n {
        for x in 0..<n {
            guard graphWeak[y][x] == true else { continue }
            rgb["RG"]! += 1
            bfsWeak(y, x)
        }
    }

    let person1 = rgb["R"]! + rgb["G"]! + rgb["B"]!
    let person2 = rgb["RG"]! + rgb["B"]!
    
    print(person1 ,person2)
}
