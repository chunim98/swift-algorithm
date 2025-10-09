//
//  2110 공유기 설치.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/9/25.
//
// https://www.acmicpc.net/problem/2110

func problem2110() {
    let nc = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, c) = (nc[0], nc[1]) // 집 개수, 공유기 수
    let coords = (0..<n).map { _ in Int(readLine()!)! }.sorted()
    
    var start = 1
    var end = (coords.last! - coords.first!) / (c-1)
    
    func canPlace(_ mid: Int) -> Bool {
        var count = 1
        var last = coords[0]
        
        for now in coords[1...] {
            guard now - last >= mid else { continue }
            count += 1
            last = now
            if count == c { return true }
        }
        return false
    }
    
    while start <= end {
        let mid = (start + end) / 2
        
        if canPlace(mid) {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(end)
}
