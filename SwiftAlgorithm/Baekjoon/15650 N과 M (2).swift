//
//  15650 N과 M (2).swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/25/25.
//
// https://www.acmicpc.net/problem/15650

func problem15650() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1]) // 자연수, 수열 길이
    
    func recur(_ seq: [Int]) {
        if seq.count == m {
            print(seq.map { String($0) }.joined(separator: " "))
        } else {
            for i in seq.last!..<n { recur(seq + [i+1]) }
        }
    }
    
    for i in 1...n { recur([i]) }
}
