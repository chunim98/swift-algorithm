//
//  1541 잃어버린 괄호.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/16/25.
//

// https://www.acmicpc.net/problem/1541

func problem1541() {
    let split = readLine()!.split(separator: "-").map {
        String($0).split(separator: "+").map { Int($0)! }.reduce(0, +)
    }
    print(split.count == 1 ? split[0] : split[1...].reduce(split[0], -))
}

// 숏코딩
//let s = readLine()!.split(separator:"-").map {String($0).split(separator:"+").map{Int($0)!}.reduce(0,+)}
//print(s.count == 1 ?s[0]:s[1...].reduce(s[0],-))
