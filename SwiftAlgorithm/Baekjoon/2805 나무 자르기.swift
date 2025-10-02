//
//  2805 나무 자르기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/3/25.
//
// https://www.acmicpc.net/problem/2805

func problem2805() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1]) // 개수, 길이
    let woods = readLine()!.split(separator: " ").map { Int($0)! }
    
    var (start, end) = (0, woods.max()!)
    
    while start <= end {
        let mid = (start + end) / 2
        let result = woods.reduce(into: 0) { acc, new in acc += new > mid ? new-mid : 0 }
        
        if result >= m {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(end)
}
