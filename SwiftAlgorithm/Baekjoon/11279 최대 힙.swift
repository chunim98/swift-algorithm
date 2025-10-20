//
//  11279 최대 힙.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/20/25.
//
// https://www.acmicpc.net/problem/11279

func problem11279() {
    var heap = [Int]()
    
    func push(_ int: Int) {
        if heap.isEmpty { heap = [0] }
        heap.append(int)
        
        var c = heap.count - 1
        
        while c > 1 {
            let p = c / 2
            guard heap[c] > heap[p] else { break }
            heap.swapAt(p, c)
            c = p
        }
    }
    
    func pop() -> Int? {
        if heap.count <= 1 { return nil }
        if heap.count == 2 { return heap.removeLast() }
        
        let maxV = heap[1]
        heap[1] = heap.removeLast()
        
        var p = 1
        
        while true {
            var np = p
            let lc = 2 * p
            let rc = 2 * p + 1
            
            if lc < heap.count, heap[np] < heap[lc] { np = lc }
            if rc < heap.count && heap[np] < heap[rc] { np = rc }
            if np == p { break }
            
            heap.swapAt(p, np)
            p = np
        }
        
        return maxV
    }
    
    for _ in 0..<Int(readLine()!)! {
        let num = Int(readLine()!)!
        num != 0 ? push(num) : print(pop() ?? 0)
    }
}
