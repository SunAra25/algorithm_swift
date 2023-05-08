//  Created by 아라 on 2023/05/08.
//  소요시간 : 0.0004940032958984375

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for c in commands {
        var arr = Array(array[(c[0] - 1)..<c[1]])
        arr.sort()
        answer.append(arr[c[2] - 1])
    }
    return answer
}

print(checkTime {
    print(solution([1, 5, 2, 6, 3, 7, 4],[[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
})
