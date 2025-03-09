//
//  18870 좌표 압축.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 3/9/25.
//

// https://www.acmicpc.net/problem/18870

func problem18870() {
    let _ = readLine() // 좌표 수
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var dic = [Int : String]()
    var idx = 0
    
    arr.sorted().forEach {
        guard dic[$0] == nil else { return }
        dic[$0] = String(idx)
        idx += 1
    }
    
    print(arr.map { dic[$0]! }.joined(separator: " "))
}
