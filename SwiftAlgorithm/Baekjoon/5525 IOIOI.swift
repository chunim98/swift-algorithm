//
//  5525 IOIOI.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/22/25.
//
// https://www.acmicpc.net/problem/5525

/// 100점
func problem5525() {
    let n = Int(readLine()!)!
    let _ = Int(readLine()!)!
    let s = Array(readLine()!)
    var streak = 0
    var head = 0
    var cnt = 0

    while head+2 < s.count {
        if s[head...head+2] == ["I", "O", "I"] {
            head += 2
            streak += 1
            if streak == n { cnt += 1; streak -= 1 }
        } else {
            head += 1
            streak = 0
        }
    }
    
    print(cnt)
}

/// 50점5
//func problem5525() {
//    let n = Array("I" + String(repeating: "OI", count: Int(readLine()!)!))
//    let m = Int(readLine()!)!
//    let s = Array(readLine()!)
//    var cnt = 0
//    
//    for head in 0..<m {
//        let tail = head + n.count - 1
//        guard tail < s.count else { break }
//        if s[head...tail] == n[n.indices] { cnt += 1 }
//    }
//    
//    print(cnt)
//}
