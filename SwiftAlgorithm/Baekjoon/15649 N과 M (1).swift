//
//  15649 N과 M (1).swift
//  SwiftAlgorithm
//
//  Created by 신정욱 on 10/28/25.
//
// https://www.acmicpc.net/problem/15649

func problem15649() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1] // 자연수 크기, 수열 길이
    var visit = [Bool](repeating: false, count: n+1)
    
    func dfs(_ nums: [Int]) {
        if nums.count == m {
            print(nums.map { "\($0)" }.joined(separator: " "))
            return
        }
        
        for i in 1...n {
            guard !visit[i] else { continue }
            visit[i] = true
            dfs(nums + [i])
            visit[i] = false
        }
    }
    
    dfs([])
}
