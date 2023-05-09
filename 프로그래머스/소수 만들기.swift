//  Created by 아라 on 2023/05/09.
//  소요시간 : 0.0004410743713378906

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    for c in combination(array: nums, n: 3) {
        let num = c.reduce(0, +)
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                break
            } else if i == Int(sqrt(Double(num))) {
                answer += 1
            }
        }
    }
    return answer
}

func combination<T>(array: [T], n: Int) -> [[T]] {
    var result = [[T]]()
    
    func combination(index: Int, current: [T]) {
        if current.count == n {
            result.append(current)
            return
        }
        for i in index..<array.count {
            combination(index: i + 1, current: current + [array[i]])
        }
    }
    combination(index: 0, current: [])
    return result
}

print(checkTime {
    print(solution([1,2,3,4]))
})
