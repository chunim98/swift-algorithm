//
//  30804 과일 탕후루.swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/29/25.
//
// https://www.acmicpc.net/problem/30804

/// 완전 탐색
func problem30804() {
    let n = Int(readLine()!)! // 과일 개수
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var results = [Int]()
    
    for i in 1...9 {
        for j in 1...9 {
            var visit = [Int](repeating: 0, count: n)
            
            for k in 0..<n {
                guard nums[k] == i || nums[k] == j else { continue }
                visit[k] = k == 0 ? 1 : visit[k-1] + 1
            }
            
            results.append(visit.max()!)
        }
    }
    
    print(results.max()!)
}


/// 투 포인터 풀이이긴 한데 자꾸 시간초과 남
/// `Set(nums[l...r])` 이 부분이 문제 같은데, 슬라이딩 윈도우 사용하면 된다는 듯...?
//func problem30804() {
//    let n = Int(readLine()!)! // 과일 개수
//    let nums = readLine()!.split(separator: " ").map { Int($0)! }
//    var r = 0
//    var best = 0
//
//    for l in 0..<n {
//        while r < n {
//            guard Set(nums[l...r]).count <= 2 else { break }
//            best = max(best, (l...r).count)
//            r += 1
//        }
//    }
//
//    print(best)
//}
