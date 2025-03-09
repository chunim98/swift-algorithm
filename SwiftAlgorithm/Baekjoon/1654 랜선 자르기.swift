//
//  1654 랜선 자르기.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/9/25.
//

// https://www.acmicpc.net/problem/1654

func problem1654() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (k, n) = (input[0], input[1]) // 가지고 있는 랜선 수, 필요한 랜선 수
    let cl = (0..<k).map { _ in Int(readLine()!)! } // 각 랜선 길이 배열
    var (start, end) = (1, cl.max()!)
    
    while start <= end {
        let mid = (start+end) / 2
        let cut = cl.map { $0 / mid }.reduce(0, +)
        
        if cut < n {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    print(end)
}
