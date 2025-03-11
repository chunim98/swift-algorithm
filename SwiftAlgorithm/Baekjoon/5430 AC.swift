//
//  5430 AC.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/11/25.
//

// https://www.acmicpc.net/problem/5430

func problem5430() {
    let t = Int(readLine()!)!

    func solution() -> String {
        let p = readLine()!
        let n = Int(readLine()!)!
        let arr = readLine()!.dropFirst().dropLast().split(separator: ",").map { String($0) }
        var (start, end, isReversed) = (0, n-1, false)
        
        for char in p {
            if char == "R" {
                isReversed = !isReversed
            } else if char == "D" {
                if start > end { return "error" }
                isReversed ? { end -= 1 }() : { start += 1 }()
            }
        }
                
        guard !(start > end) else { return "[]" }
        
        let result = isReversed
        ? arr[start...end].reversed().joined(separator: ",")
        : arr[start...end].joined(separator: ",")
        
        return "[\(result)]"
    }
    
    for _ in 0..<t { print(solution()) }
}
