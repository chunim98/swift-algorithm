//
//  29812 아니 이게 왜 안 돼 .swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/26/25.
//
// https://www.acmicpc.net/problem/29812

import Foundation

func problem29812() {
    let _ = Int(readLine()!)! // n 필요 없음
    let s = readLine()!
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, m) = (input[0], input[1]) // 딜리트, 드래그
    var (h, y, u) = (0, 0, 0)
    
    let totalCost = s
        .components(separatedBy: ["H", "Y", "U"])
        .filter { $0 != "" }
        .reduce(0) { $0 + min($1.count*d, d+m) }

    for char in s {
        if char == "H" { h += 1; continue }
        if char == "Y" { y += 1; continue }
        if char == "U" { u += 1; continue }
    }
    
    print(totalCost == 0 ? "Nalmeok" : totalCost)
    print(min(h, y, u) == 0 ? "I love HanYang University" : min(h, y, u))
}
