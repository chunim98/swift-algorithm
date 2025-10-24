//
//  1806 부분합.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/24/25.
//
// https://www.acmicpc.net/problem/1806

func problem1806() {
    let ns = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, s) = (ns[0], ns[1]) // 수열 길이, 기준치
    var ps = [0]
    var r = 0
    var best = Int.max

    readLine()!.split(separator: " ").forEach { ps.append(ps.last! + Int($0)!) }

    for l in 1...n {
        while r <= n {
            if ps[r] - ps[l-1] < s {
                r += 1
            } else {
                best = min(best, r-l+1)
                break
            }
        }
    }

    print(best == .max ? 0 : best)
}
