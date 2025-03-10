//
//  1931 회의실 배정.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/10/25.
//

// https://www.acmicpc.net/problem/1931

func problem1931() {
    let n = Int(readLine()!)!
    var arr = (0..<n).map { _ -> (Int, Int) in
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        return (input[0], input[1])
    }
    var pivot = 0
    var result = 0
    
    // 종료 시간 기준으로 오름차 정렬, 종료 시간이 같을 경우 빨리 시작하는 회의 우선
    arr.sort { ($0.1 == $1.1) ? ($0.0 < $1.0) : ($0.1 < $1.1) }
    arr.forEach { if $0.0 >= pivot { pivot = $0.1; result += 1 } }
    print(result)
}




