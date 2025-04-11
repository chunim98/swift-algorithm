//
//  16953 A → B.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 4/11/25.
//
// https://www.acmicpc.net/problem/16953

func problem16953() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var (a, b) = (input[0], input[1])
    var count = 0
    
    while !(b <= a) {
        if b % 2 == 0 {
            b /= 2
        } else {
            guard String(b).last! == "1" else { break }
            b = (b-1) / 10
        }
        count += 1
    }
    
    print(b == a ? count+1 : -1)
}
